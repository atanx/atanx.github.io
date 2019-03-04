---
layout: post
title: Python-GUI界面开发-Tkinter基础(1)
description: Python Tkinter Helloword应用
category: 技术
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

