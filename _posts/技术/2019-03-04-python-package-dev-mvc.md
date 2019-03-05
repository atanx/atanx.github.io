---
layout: post
title: Python-库开发-MVC框架
description: Python-库开发-MVC框架
category: 技术
---

```python
#!/usr/bin/env python
# coding=utf-8

class Model(object):
	def __init__(self):
		pass

	def get_summary(self, defectId):
		data = {'a': 'defect a', 'b': 'defect b'}
		return data.get(defectId, 'unknwon')


class View(object):
	def __init__(self):
		pass

	def show_summary(self, data):
		formatted = '=====\n{data}'.format(data=data)
		print formatted


class Controller(object):
	def __init__(self):
		pass

	def get_defect_summary(self, defectid):
		model = Model()
		view = View()
		data = model.get_summary(defectid)
		return view.show_summary(data)


if __name__ == '__main__':
	controller = Controller()
	controller.get_defect_summary('a')
	controller.get_defect_summary('b')

```