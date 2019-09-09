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



