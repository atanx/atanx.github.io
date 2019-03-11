---
layout: post
title: python常用的数据结构-栈(1)
description: python常用的数据结构-栈(1)
category: 技术
---

## 什么是栈
`栈`是一种后进先出(LIFO)的数据结构。

## 栈的抽象数据类型

1. S.push(e)  #将一个元素入栈
2. S.pop()   #将一个元素出栈
3. S.top()     #不移除元素的情况下返回一个栈的栈顶元素
4. S.is_empty() #判断栈是否为空
5. len(S)       #栈的长度

## 栈的Python实现
```python
#!/usr/bin/env python
# coding=utf-8
#
# Copyright 2019, Bin Jiang
#
# s实现栈数据结构

from .error import EmptyError


class Stack(object):
	def __init__(self):
		self._data = []

	def push(self, e):
		""" 入栈一个元素 """
		self._data.append(e)

	def pop(self):
		""" 出栈一个元素 """
		if self.is_empty():
			raise EmptyError('Stack is empty')
		return self._data.pop()

	def top(self):
		""" 查看栈顶 """
		if self.is_empty():
			raise EmptyError('Stack is empty')
		return self._data[-1]

	def __len__(self):
		return len(self._data)

	def is_empty(self):
		return len(self._data) == 0

```