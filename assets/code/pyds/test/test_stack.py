#!/usr/bin/env python
# coding=utf-8

from pyds import Stack, EmptyError
import unittest


class TestStack(unittest.TestCase):

	def test_stack_1(self):
		s = Stack()
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
		s = Stack()
		for c in chars:
			s.push(c)

		new_chars = ''
		while not s.is_empty():
			new_chars += s.pop()
		print new_chars
		self.assertEqual(new_chars, 'dlrowolleh')

if __name__ == "__main__":
	unittest.main()
