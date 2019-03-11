---
layout: post
title: python常用的数据结构3-双端队列
description: python常用的数据结构3-双端队列
category: 技术
---

## 什么是双端队列
`队列`是一种先进先出(FIFO)的数据结构。

## 双端队列的抽象数据类型

1. Q.add_first(e)  # 向双端队列前面添加一个元素e
2. Q.add_last(e)   # 向双端队列后面添加一个元素e
3. Q.delete_first()     # 头部移除并返回一个元素，若为空触发一个错误
4. Q.delete_last() # 尾部移除并返回一个元素，若为空触发一个错误
5. D.first()
6. D.last()
7. D.is_empty()  # 判断双端队列是否为空
8. len(Q)       # 返回队列长度

## 双端队列的Python实现
```python
#!/usr/bin/env python
# coding=utf-8
#
# Copyright 2019, Bin Jiang
#
# 实现队列数据结构

from pyds.error import EmptyError
from collections import deque


class Deque(object):
	def __init__(self):
		self._deque = deque()

	def add_first(self, e):
		""" 头部添加一个元素 """
		self._deque.appendleft(e)

	def add_last(self, e):
		""" 尾部添加一个元素 """
		self._deque.append(e)

	def delete_first(self):
		""" 头部移除一个元素 """
		if self.is_empty():
			raise EmptyError('deque is empty')
		return self._deque.popleft()

	def delete_last(self):
		""" 尾部移除一个元素 """
		if self.is_empty():
			raise EmptyError('deque is empty')
		return self._deque.pop()

	def first(self):
		""" 访问第一个元素 """
		return self._deque[0]

	def last(self):
		""" 访问最后一个元素 """
		return self._deque[-1]

	def __len__(self):
		return len(self._deque)

	def is_empty(self):
		""" 判断双端队列是否为空 """
		return len(self._deque) == 0

```