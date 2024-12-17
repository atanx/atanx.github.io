---
layout: post
title: Cython Wrapper SO
description: Cython Wrapper SO
category: Python
---

使用Cython 封装so库的过程如下：
1. 编写pyx文件，用于定义Cython扩展模块
2. 创建一个setup.py文件，用于配置Cython扩展模块
3. 使用Cython编译pyx文件，生成pyd文件, 这个pyd文件是Cython编译后的Python扩展模块 `python setup.py build_ext --inplace`
4. 在Python项目中使用Cython扩展模块


## 1. 编写pyx文件
pyx文件是Cython编译后的Python扩展模块，它包含了Cython的语法和C语言的语法，可以用来定义Cython扩展模块。 首先使用cdef extern from "C" 语法从C头文件中导入常量，使用cdef extern from "C" 语法从C头文件中导入函数。
然后使用cdef class定义Cython类, Cython类是可以被Cython编译器编译的Python类。

```python
# so_wrapper.pyx
from libc.stdlib cimport malloc, free
from libc.string cimport strcpy, strlen
import time

cdef extern from "mt_scylla.h":
    int SCYMTInitializeEx(const char* reserved)
    const char* SCYMTSessionBeginEx(const char* param, int* errorCode, void* reserved)
    const char* SCYMTAudioWriteEx(const char* sessionID, const char* waveData, 
                                 unsigned int waveLen, int audioStatus, 
                                 int* epStatus, int* recogStatus, int* errCode, 
                                 void* reserved)
    const char* SCYMTGetResultEx(const char* sessionID, int* rsltStatus, 
                                int waitTime, int* errorCode, void* reserved)
    int SCYMTSessionEndEx(const char* sessionId)
    int SCYMTUninitializeEx(void* reserved)
    
    # Cython语法：从C头文件导入常量
    # 格式：类型 Python中使用的名称 "C头文件中的实际名称"
    
    # 音频数据块的状态标识
    int SCY_AUDIO_SAMPLE_FIRST "SCY_AUDIO_SAMPLE_FIRST"      # 第一个音频数据块
    int SCY_AUDIO_SAMPLE_CONTINUE "SCY_AUDIO_SAMPLE_CONTINUE" # 中间的音频数据块
    int SCY_AUDIO_SAMPLE_LAST "SCY_AUDIO_SAMPLE_LAST"        # 最后一个音频数据块

class ASRError(Exception):
    pass

cdef class ASREngine:
    cdef const char* session_id
    
    def __init__(self):
        self.session_id = NULL
        
    def initialize(self):
        ret = SCYMTInitializeEx("")
        if ret != 0:
            raise ASRError(f"Initialize failed with code {ret}")
            
    def start_session(self, url, appid, auf="audio/L16;rate=16000", 
                     svc="iat", aue="raw", type="1", uid="660Y5r", extend_params=None):
        """开始会话
        参考文档：
        Args:
            url: 服务器地址，格式为 ip:port
            appid: 应用ID
            auf: 音频格式，默认为 audio/L16;rate=16000
            svc: 服务类型，默认为 iat（语音识别）
            aue: 音频编码，默认为 raw
            type: 语言类型，默认为 1（汉语）
            uid: 用户ID，默认为 660Y5r
            extend_params: 扩展参数，JSON格式字符串
        """
        cdef:
            int error_code = 0
            const char* session_id
            bytes params_bytes
        
        # 构建参数字符串
        params = f"url={url},appid={appid},auf={auf},svc={svc},aue={aue},type={type}" + ",extend_params={\"params\":\"dwa=wpgs\"}"
        if uid:
            params += f",uid={uid}"
        
        print(f"params: {params}")
        # 转换为 bytes 并保持引用
        params_bytes = params.encode('utf-8')
        
        # 调用 C 函数
        session_id = SCYMTSessionBeginEx(params_bytes, &error_code, NULL)
        if error_code != 0 or session_id == NULL:  # SCY_SUCCESS
            raise ASRError(f"Session begin failed with code {error_code}")
        
        self.session_id = session_id
        return session_id

    def write_audio(self, bytes audio_data, bint is_first=False, bint is_last=False):
        cdef:
            int ep_status = 0
            int recog_status = 0
            int err_code = 0
            const char* result
            
        # 设置音频状态
        cdef int audio_status
        if is_first:
            audio_status = SCY_AUDIO_SAMPLE_FIRST
        elif is_last:
            audio_status = SCY_AUDIO_SAMPLE_LAST
        else:
            audio_status = SCY_AUDIO_SAMPLE_CONTINUE
            
        # 写入音频数据
        result = SCYMTAudioWriteEx(
            self.session_id,
            audio_data,
            len(audio_data),
            audio_status,
            &ep_status,
            &recog_status,
            &err_code,
            NULL
        )
        
        # 在线识别模式下添加延时
        if not is_last:  # 只在非最后一块时延时
            time.sleep(0.08)  # sleep 80ms
            
        if err_code != 0:
            raise ASRError(f"Audio write failed with error code: {err_code}")
            
        return result.decode('utf-8') if result != NULL else None

    def end_session(self, session_id):
        """结束当前会话"""
        if session_id:
            ret = SCYMTSessionEndEx(session_id)
            if ret != 0:  # SCY_SUCCESS
                raise ASRError(f"Session end failed with code {ret}")
            self.session_id = NULL

    def get_result(self):
        """获取识别结果"""
        cdef:
            int rslt_status = 0
            int error_code = 0
            const char* result
        
        result = SCYMTGetResultEx(self.session_id, &rslt_status, 5, &error_code, NULL)
        if error_code != 0:
            raise ASRError(f"Get result failed with error code: {error_code}")
        
        return result.decode('utf-8') if result != NULL else None

```

## 2. 创建setup.py文件
setup.py文件是Cython编译器的配置文件，它用于配置Cython扩展模块。 首先使用setup函数定义Cython扩展模块，然后使用Extension函数定义Cython扩展模块的名称和源文件，最后使用cythonize函数编译Cython扩展模块。

注意：
1. include_dirs是头文件目录的绝对路径
2. library_dirs是库文件的路径, 这个路径是库文件(如.so文件/.lib文件)的存放路径
3. libraries是库文件的名称，不需要.so后缀或.lib后缀


```python
from setuptools import setup, Extension
from Cython.Build import cythonize
import os

# 获取头文件目录的绝对路径
include_dir = os.path.abspath(os.path.join('src', 'include'))

extensions = [
    Extension(
        "so_wrapper",
        ["src/so_wrapper.pyx"],
        include_dirs=[include_dir],
        library_dirs=['lib'],
        libraries=['mt_scylla']
    )
]

setup(
    name='so_wrapper',
    ext_modules=cythonize(extensions),
    package_dir={'': 'src'},
    zip_safe=False,
)

```

## 3. 编译pyx文件
```bash
python setup.py build_ext --inplace
```

## 4. 在Python项目中使用Cython扩展模块
```python
import so_wrapper
```


## 5. windows下包装dll文件注意事项

在Windows下，如果我们只有.dll文件，我们需要使用工具生成.lib文件。


DLL导出lib文件。
```bash
dumpbin /exports mt_syclla.dll
```

编写一个mt_syclla.def文件，内容如下，注意EXPORTS后面是函数名称，而不是函数声明。LIBRARY后面是dll文件名称。
```
LIBRARY mt_syclla.dll
EXPORTS
SCYMTInitializeEx
SCYMTSessionBeginEx
SCYMTAudioWriteEx
SCYMTGetResultEx
SCYMTSessionEndEx
```

使用lib工具生成.lib文件, 注意/machine:x64 是64位系统，如果是32位系统，则需要使用/machine:x86。本文档一定是行得通的，名称一定要注意拼写正确。
```bash
lib /def:mt_scylla.def /out:mt_scylla.lib /machine:x64 
```

