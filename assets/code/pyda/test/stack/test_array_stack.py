#!/usr/bin/env python
# coding=utf-8

import unittest
from pyda.stack import ArrayStack


class TestArrayStack(unittest.TestCase):

	def test_stack_1(self):
		""" 测试Array基本的操作 """
		s = ArrayStack()
		self.assertTrue(s.is_empty())

		s.push(1)
		self.assertEqual(s.top(), 1)

		s.push(2)
		self.assertEqual(s.top(), 2)
		self.assertEqual(len(s), 2)

		s.push(3)
		self.assertEqual(s.top(), 3)
		self.assertEqual(len(s), 3)

		self.assertEqual(s.pop(), 3)
		self.assertEqual(len(s), 2)
		self.assertEqual(s.top(), 2)

		s.pop()
		s.pop()
		# self.assertRaises(s.pop(), EmptyError)

	def test_reverse(self):
		chars = 'helloworld'
		s = ArrayStack()
		for c in chars:
			s.push(c)

		new_chars = ''
		while not s.is_empty():
			new_chars += s.pop()
		print new_chars
		self.assertEqual(new_chars, 'dlrowolleh')


if __name__ == '__main__':
	unittest.main()
















