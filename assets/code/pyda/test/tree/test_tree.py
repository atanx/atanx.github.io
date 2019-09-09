#!/usr/bin/env python
# coding=utf-8

import unittest
from pyda.tree import LinkedBinaryTree


class TestTree(unittest.TestCase):

	def test_stack_1(self):
		""" 测试Array基本的操作 """
		tree = LinkedBinaryTree()
		root = tree._add_root(12)
		node2 = tree._add_left(root, 5)
		node3 = tree._add_right(root, 6)
		node4 = tree._add_left(node2, 1)

		print root.element()
		print node2.element()
		print node3.element()
		print node4.element()

		print "breadthfirst" + "="*20
		for node in tree.breadthfirst():
			print node.element()

		print "preorder" + "=" * 20
		for node in tree.preorder():
			print node.element()


if __name__ == '__main__':
	unittest.main()

