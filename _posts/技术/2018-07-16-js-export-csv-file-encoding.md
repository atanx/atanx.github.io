---
layout: post
title: JS-导出CSV文件乱码解决
description: JS-导出CSV文件乱码解决
category: 技术
---
utf-8保存的csv格式文件要让Excel正常打开的话，必须加入在文件最前面加入BOM(Byte order)。如果接收者收到以EF BB BF开头的字节流，就知道这是UTF-8编码了。
```javascript
var content = "日期,用户名\r\n2018-08-01,张三"; 

content = "\uFEFF"+content; //

var blob = new Blob([content], {type: 'text/plain'});
var link = document.createElement('a');
link.download = '测试.csv';
link.href = window.URL.createObjectURL(blob);
link.style.display = 'none';
document.body.appendChild(link);
link.click();      
```