#!/usr/bin/env python
# coding=utf-8

import unittest
from pyda.queue import SortedPriorityQueue, UnsortedPriorityQueue
from pyda.exceptions import Empty


class TestPriorityQueue(unittest.TestCase):
	def test_sorted_priority_queue(self):
		""" 测试ArrayQueue基本的操作 """
		spq = SortedPriorityQueue()
		self.assertTrue(spq.is_empty())

		data = [(5, 'A'), (9, 'C'), (3, 'B'), (7, 'D')]
		for k, v in data:
			spq.add(k, v)

		self.assertEqual(spq.min(), (3, 'B'))
		self.assertEqual(spq.remove_min(), (3, 'B'))
		self.assertEqual(spq.remove_min(), (5, 'A'))
		self.assertEqual(spq.remove_min(), (7, 'D'))
		self.assertEqual(spq.remove_min(), (9, 'C'))
		self.assertTrue(spq.is_empty())

		# 数组为空时报异常 Empty
		self.assertRaises(Empty, spq.remove_min)

	def test_unsorted_priority_queue(self):
		spq = UnsortedPriorityQueue()
		self.assertTrue(spq.is_empty())

		data = [(5, 'A'), (9, 'C'), (3, 'B'), (7, 'D')]
		for k, v in data:
			spq.add(k, v)

		self.assertEqual(spq.min(), (3, 'B'))
		self.assertEqual(spq.remove_min(), (3, 'B'))
		self.assertEqual(spq.remove_min(), (5, 'A'))
		self.assertEqual(spq.remove_min(), (7, 'D'))
		self.assertEqual(spq.remove_min(), (9, 'C'))
		self.assertTrue(spq.is_empty())

		# 数组为空时报异常 Empty
		self.assertRaises(Empty, spq.remove_min)


if __name__ == '__main__':
	unittest.main()
