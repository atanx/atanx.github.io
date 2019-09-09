---
layout: post
title: PHP-配置phpstorm进行debug
description: PHP-配置phpstorm进行debug
category: 技术
---
[toc]
# 安装

# debug

- xdebug helper (chrome扩展)
- phpstorm

## 配置phpstorm 
1. `settings/language&frameworks/php/debug`目录下`xdebug`的`Debug Port`端口设置成9000(同php.ini）
2. `settings/language&frameworks/php/debug/DBGp Proxy`的端口设置成php网站的端口，例如81 
2. `settings/language&frameworks/php/servers 添加网站。

## 配置xdebug helper
**安装**chrome扩展，在chrome://extentions扩展页，打开xdebug helper的设置选项，设置IDE key为phpstorm.

# 数据库

## MYSQL has gone away错误
原因：通信数据包达到上限。修改`my.ini`中的`max_allowed_packet=1024M`,具体值根据实际情况调大。

## MYSQL插入数据乱码
原因：编码问题,设置编码为`utf8`。
```php
$conn2 = new mysqli("localhost", "root", "root", "test", 3306);
if ($conn2->connect_error) {
    die("连接失败: " . $conn2->connect_error);
}
// 建立连接后设置编码为utf8，使用utf-8也会出错
mysqli_query($conn2, "set names utf8");

```


# 网页
## 数据库查询乱码
添加代码
```php
header("Content-type:text/html;charset=utf-8");  //统一输出编码为utf-8
```