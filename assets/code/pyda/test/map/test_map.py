#!/usr/bin/env python
# coding=utf-8

import unittest
from pyda.map import SortedTableMap


class TestArrayQueue(unittest.TestCase):
	def test_sorted_map(self):
		""" 测试 SortedTableMap 基本的操作 """
		map = SortedTableMap()
		map['a'] = 12
		map['b'] = 14
		map['a'] = 13
		self.assertEqual(map['a'], 13)
		for k, v in map.iteritems():
			print k, v

if __name__ == '__main__':
	unittest.main()
