---
layout: post
title: MATLAB-使用包管理脚本
description: MATLAB-使用包管理脚本
category: 技术
---

在MATLAB中以`+`开头的文件夹会被视为一个包。

我们通过如下流程对`包`进行测试试验。

1. 在matlab工作目录中创建一个文件夹`+test`
2. 在`+test`中创建一下两个文件。
```matlab
% method1.m
function method1()
    disp 这是method1;
end
```

```matlab
% method2.m
function method2()
    disp 这是method2;
end
```

3. 在matlab命令行窗口调用包中的函数。
```matlab
>>> test.method1() % 返回: 这是method1

>>> test.method2() % 返回: 这是method2

```

## 脚本验证

将下面代码保存在工作目录中。运行自动创建测试上述包。

```matlab
% 测试matlab包
% test_package.m

%% data
folder = '+test';
m1 = [  'function method1()', char(10), ...
        'disp 这是method1;', char(10), ...
        'end'];
m2 = [  'function method2()',  char(10),...
        'disp 这是method2;',  char(10),...
        'end'];
files = struct('method1',m1, 'method2', m2);
                   
               

%% 创建文件夹+test
 mkdir +test;
cd +test;
%% 创建文件  
names = fieldnames(files);
for idx = 1:length(names)
    name = names{idx};
    content = files.(name); 
    filename = [name, '.m'];
    fid = fopen(filename,'w+');
    fprintf(fid, '%s', content);
    fclose(fid);
end

%% 测试
cd ..
test.method1()
test.method2()

```
