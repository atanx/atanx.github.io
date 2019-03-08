---
layout: post
title: Python-使用pptx合成pptx文件
description:  Python-使用pptx合成pptx文件
category: 技术
---
![](/images/python-pptx/hello-world.jpg)
python合成powerpoint文件所使用的库为`python-pptx`
可以通过pip进行安装。
更多介绍详见。[官方文档](https://python-pptx.readthedocs.io/en/latest/index.html)
```
pip install python-pptx
```

# Demo1

```python
#!/usr/bin/env python
#coding=utf-8

from pptx import Presentation
# 创建幻灯片 ------
prs = Presentation()
title_slide_layout = prs.slide_layouts[0]
slide = prs.slides.add_slide(title_slide_layout)

title = slide.shapes.title
subtitle = slide.placeholders[1]

# 设置标题和副标题
title.text = "Hello, World!"
subtitle.text = "pip install python-pptx"

prs.save("test.pptx")


```
