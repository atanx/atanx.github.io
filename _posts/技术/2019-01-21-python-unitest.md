---
layout: post
title: Python-使用unittest进行单元测试和文档测试
description: Python-使用unittest进行单元测试和文档测试
category: 技术
---
## 单元测试和文档测试
```python
#!/usr/bin/env python
# coding=utf-8
""" 测试 heapq """
import heapq
import unittest


class Item(object):
	"""
	>>> a= Item(6)
	>>> a.value
	6
	"""

	def __init__(self, v):
		self.value = v

	def __lt__(self, other):
		return self.value < other.value

	def __repr__(self):
		return 'Item({value})'.format(value=self.value)

	__str__ = __repr__


def log(func):
	def wrapper(*args, **kwargs):
		print "hello this is log"
		return func(*args, **kwargs)

	return wrapper


def log2(text):
	def wrapper(func):
		def _wrapper(*args, **kwargs):
			t = args[0]
			if hasattr(t, 'messages'):
				t.messags.append(text)
			else:
				t.messages = [text]
			print text
			return func(*args, **kwargs)

		return _wrapper

	return wrapper


class TestHeapq(unittest.TestCase):
	@log2("hello 12")
	def setUp(self):
		print "setup..."

	def tearDown(self):
		print "tearDown..."

	@unittest.skip('跳过该测试\n')
	def test_heapq(self):
		x = [1, 2, 3, 5, 610]
		a = heapq.nlargest(2, x)
		self.assertEqual(a, [610, 5])

	def test_heapq_item(self):
		x = [1, 2, 3, 5, 610]
		z = [Item(i) for i in x]
		a = heapq.nlargest(2, z)
		a = [i.value for i in a]
		self.assertEqual(a, [610, 5])
		print self.messages


if __name__ == "__main__":
	unittest.main()

	
```
