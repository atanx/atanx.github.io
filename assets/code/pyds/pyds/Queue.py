#!/usr/bin/env python
# coding=utf-8
#
# Copyright 2019, Bin Jiang
#
# 实现队列数据结构

from .error import EmptyError
from collections import deque

class Queue(object):
	def __init__(self):
		self._data = []

	def enqueue(self, e):
		""" 入栈一个元素 """
		self._data.append(e)

	def dequeue(self):
		""" 出栈一个元素 """
		if self.is_empty():
			raise EmptyError('Queue is empty')
		return self._data.pop(0)

	def first(self):
		""" 查看栈顶 """
		if self.is_empty():
			raise EmptyError('Queue is empty')
		return self._data[0]

	def __len__(self):
		return len(self._data)

	def is_empty(self):
		return len(self._data) == 0

