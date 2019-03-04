---
layout: post
title: Python-使用PIL处理图像
description: Python-使用PIL处理图像
category: 技术
---

## DEMO程序
```python
# 缩略图生成
from PIL import Image as PilImage
img = PilImage.open(self.abspath)
img.thumbnail((new_width, new_height), PilImage.ANTIALIAS)
img.save(dst)

# 裁剪图片
new_img = img.crop((left, upper, right, lower))
file_path = os.path.join(self.path, self.name + '.min' + self.ext)
new_img.save(file_path)

# 拼接图片

for f in 
region = im.open()
im.paste(region)
```
