#!/usr/bin/env python
# coding=utf-8
#
# Copyright 2019, Bin Jiang
#
# 实现队列数据结构

from .error import EmptyError
from collections import deque
from _DoubleLinkedBase import _DoubleLinkedBase


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


class LinkedDeque(_DoubleLinkedBase):
	def __iter__(self):
		pass

	def add_first(self, e):
		""" 头部添加一个元素 """
		self._insert_between(e, self._header, self._header._next)

	def add_last(self, e):
		""" 尾部添加一个元素 """
		self._insert_between(e, self._trailer._prev, self._trailer)

	def delete_first(self):
		""" 头部移除一个元素 """
		if self.is_empty():
			raise EmptyError('deque is empty')
		return self._delete_node(self._header._next)

	def delete_last(self):
		""" 尾部移除一个元素 """
		if self.is_empty():
			raise EmptyError('deque is empty')
		return self._delete_node(self._trailer._prev)

	def first(self):
		""" 访问第一个元素 """
		if self.is_empty():
			raise EmptyError("Deque is empty")
		return self._header._next._element

	def last(self):
		""" 访问最后一个元素 """
		if self.is_empty():
			raise EmptyError("Deque is empty")
		return self._trailer._prev._element

	def disp(self):
		node = self._header
		while node._next != self._trailer:
			node = node._next
			print node._element,
		return self

