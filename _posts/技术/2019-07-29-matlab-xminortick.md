---
layout: post
title: MATLAB设置长短刻度
description: MATLAB设置二级刻度，长短刻度。
category: 技术
---

# MATLAB显示短刻度
![图片](https://atanx.github.io/images/matlab/matlab-xminortick.png)

```matlab
>> a = 0:.1:20;
>> b = sin(a);
>> plot(a,b)
>> set(gca,'xminortick','on')  // 关键代码
```

[原始连接](https://boke112.com/bkml/6397.html)

