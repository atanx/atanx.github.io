---
layout: post
title: 2019年3月新征程
description: 2019年3月新征程
category: 生活
---


 # 基本GUI
```python
#coding=utf-8
import Tkinter as Tk
root = Tk.Tk()
root.geometry("800x600")
root.title('演示demo')

def disp():
 print "hello world"

btn = Tk.Button(root, text='click', command=disp)
btn.pack()
```

