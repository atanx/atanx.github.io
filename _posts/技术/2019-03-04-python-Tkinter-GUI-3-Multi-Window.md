---
layout: post
title: Python-GUI界面开发-多窗口(3)
description: Python-GUI界面开发-多窗口(3)
category: 技术
---


# base
```python
#!/usr/bin/env python
# coding=utf-8

import Tkinter as Tk


class OtherFrame(Tk.Toplevel):
	""""""

	def __init__(self, original):
		"""Constructor"""
		self.original_frame = original
		Tk.Toplevel.__init__(self)
		self.geometry("400x300")
		self.title("otherFrame")

		btn = Tk.Button(self, text="Close", command=self.onClose)
		btn.pack()

	def onClose(self):
		""""""
		self.destroy()
		self.original_frame.show()


class MyApp(object):
	""""""

	def __init__(self, parent):
		"""Constructor"""
		self.root = parent
		self.root.title("Main frame")
		self.frame = Tk.Frame(parent)
		self.frame.pack()

		btn = Tk.Button(self.frame, text="Open Frame", command=self.openFrame)
		btn.pack()
		var = Tk.Variable()
		var.set('hello world')
		entry = Tk.Entry(self.root, textvariable=var)
		entry.pack()
		entry.bind('<Key>', self.printKey)

	def printKey(self, event):
		print u'你按下了: ' + event.char + u' charcode=' + str(event.keycode)
	def hide(self):
		""""""
		self.root.withdraw()

	def openFrame(self):
		""""""
		self.hide()
		subFrame = OtherFrame(self)

	def show(self):
		""""""
		self.root.update()
		self.root.deiconify()


def printKey(event):
	print event.char

if __name__ == "__main__":
	root = Tk.Tk()
	root.geometry("800x600")
	root.bind('<Key>', printKey)
	app = MyApp(root)
	root.mainloop()

```