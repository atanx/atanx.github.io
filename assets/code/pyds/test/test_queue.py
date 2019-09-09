#!/usr/bin/env python
# coding=utf-8

from pyds import Queue, EmptyError
import unittest


class TestStack(unittest.TestCase):

	def test_stack_1(self):
		s = Queue()
		self.assertTrue(s.is_empty())

		s.enqueue(1)
		self.assertEqual(s.first(), 1)

		s.enqueue(2)
		self.assertEqual(s.first(), 1)
		self.assertEqual(len(s), 2)

		s.enqueue(3)
		self.assertEqual(s.first(), 1)
		self.assertEqual(len(s), 3)

		self.assertEqual(s.dequeue(), 1)
		self.assertEqual(len(s), 2)
		self.assertEqual(s.first(), 2)

		s.dequeue()
		s.dequeue()
		# self.assertRaises(s.pop(), EmptyError)

	def test_string(self):
		chars = 'helloworld'
		s = Queue()
		for c in chars:
			s.enqueue(c)

		new_chars = ''
		while not s.is_empty():
			new_chars += s.dequeue()
		print new_chars
		self.assertEqual(new_chars, chars)

if __name__ == "__main__":
	unittest.main()
