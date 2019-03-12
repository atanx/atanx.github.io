#!/usr/bin/env python
# coding=utf-8

import unittest
from pyda.queue import ArrayQueue


class TestArrayQueue(unittest.TestCase):

	def test_array_queue(self):
		""" 测试ArrayQueue基本的操作 """
		s = ArrayQueue()
		self.assertTrue(s.is_empty())

		for i in range(0, 10):
			s.enqueue(i)

		self.assertEqual(len(s), 10)        # s =  0,1,2,...,9
		self.assertEqual(s.first(), 0)      # 队列第一个元素是0
		self.assertEqual(s.dequeue(), 0)    # 队列出队的元素是0
		self.assertEqual(len(s), 9)         # 队列的长度为9

		while not s.is_empty():  # 1 2 3 4 5 6 7 8 9
			print s.dequeue(),


if __name__ == '__main__':
	unittest.main()
















