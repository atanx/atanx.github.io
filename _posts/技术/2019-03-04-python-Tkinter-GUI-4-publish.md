---
layout: post
title: Python-GUI界面开发-打包发布(4)
description: Python-GUI界面开发-打包发布(3)
category: 技术
---


### 1. 编写setup.py

```python
#!/usr/bin/env python
#coding=utf-8
from distutils.core import setup
import py2exe
import sys

sys.argv.append("py2exe") 
INCLUDES = ['sip', 'six', 'lxml']

options = {"py2exe":
    {"compressed": 1,
     "optimize": 0,
     "bundle_files": 2,
     "includes": INCLUDES,
     "dll_excludes": [ "MSVCP90.dll", "mswsock.dll", "powrprof.dll","w9xpopen.exe"]  # 排除dll
	 }}

setup(
    options=options,
    description="企查查法人查询",
    zipfile=None,
	windows=['qichachaApp.py']
    #console=[{"script": "qichachaApp.py"}],
    )

```

### 2. 执行脚本

```sh
#若报importError，尝试使用 -p 参数
python setup.py py2exe -p lxml,gzip,six 
```

### 3. 添加DLL文件

> 若出错，尝试将msvcm90.dll, msvcp90.dll, msvcr90.dll复制到dist目录下。


### 4. 异常解决
>running py2exe
creating D:\data\bitbucket\weixin_project\build
creating D:\data\bitbucket\weixin_project\build\bdist.win32
creating D:\data\bitbucket\weixin_project\build\bdist.win32\winexe
creating D:\data\bitbucket\weixin_project\build\bdist.win32\winexe\collect-2.7
creating D:\data\bitbucket\weixin_project\build\bdist.win32\winexe\bundle-2.7
creating D:\data\bitbucket\weixin_project\build\bdist.win32\winexe\temp
*** searching for required modules ***
error: compiling 'C:\Python27\lib\site-packages\PyQt4\uic\port_v3\proxy_base.py'
 failed
    SyntaxError: invalid syntax (proxy_base.py, line 31)





如上，打包时出错，可以将上述port_v3的文件改为port_v3_，然后就能正常运行了。
