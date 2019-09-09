---
layout: post
title: github-解决访问github太慢的问题
description: github-解决访问github太慢的问题
category: 技术
---

## 问题描述
> 从github checkout自己的项目，半天过去了仍然无法完整的下载整个项目。
> 通过度娘找到了该问题的解决方法。造成该问题的原因可能是GitHub 的CDN域名遭到DNS污染。


## 问题解决

我的电脑是windows环境，修改hosts文件。增加如下内容：
```
192.30.253.112 github.com
192.30.253.113 github.com
151.101.184.133 assets-cdn.github.com
151.101.185.194 github.global.ssl.fastly.net
```
更新hosts文件之后，重新checkout，飞一般的感觉。


[原始连接](https://boke112.com/bkml/6397.html)

