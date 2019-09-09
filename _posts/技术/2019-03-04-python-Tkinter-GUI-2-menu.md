---
layout: post
title: Python-GUI界面开发-菜单列表栏(2)
description: Python-GUI界面开发-菜单列表栏
category: 技术
---

```python
#!/usr/bin/env python
# coding=utf-8

from Tkinter import *
import ttk

def resize(ev=None):
	label.config(font='Helvetica -%d bold' % scale.get())


top = Tk()
top.geometry('800x600')

leftFrame = Frame(top)
leftFrame.pack(side=LEFT, fill=Y)

rightFrame = Frame(top)
rightFrame.pack(side=LEFT, fill=BOTH, expand=1)


# 创建菜单栏 (Menu)
menubar = Menu(top)
top.config(menu=menubar)
# 创建文件下拉菜单
filemenu = Menu(menubar, tearoff=0)
menubar.add_cascade(label="文件", menu=filemenu)
filemenu.add_command(label="新建...", command=top.quit)
filemenu.add_command(label="打开...", command=top.quit)
filemenu.add_command(label="保存", command=top.quit)
filemenu.add_command(label="关闭填写", command=top.quit)



listbox = Listbox(leftFrame)
listbox.pack(fill=BOTH, expand=1)
listbox.insert(0, 'hello')
listbox.insert(0, 'world')


def print_item(e):
	print e.widget.get(e.widget.curselection())

listbox.bind('<ButtonRelease-1>', print_item)

label = Label(rightFrame, text="Hello world", font='Helvetica -12 bold')
label.pack(fill=Y, expand=1)

scale = Scale(rightFrame, from_=10, to=40, orient=HORIZONTAL, command=resize)
scale.set(12)
scale.pack(fill=X, expand=1)

quit = Button(rightFrame, text='QUIT', command=top.quit, activeforeground='white', activebackground='red')
quit.pack()


show = True
def toggle():
	global show
	if show:
		show = False
	else:
		leftFrame.pack(top)

ttk.Button(rightFrame, text='Quit2', command=toggle).pack()


mainloop()

```
