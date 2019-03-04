---
layout: post
title: Python-创建自定义包
description: Python-创建自定义包
category: 技术
---
## 使用python创建自定义包

下面的代码可以创建一个基本的自定义包项目结构。 

```python
#!/usr/bin/env python
# coding=utf-8
import sys
import os

code = "#!/usr/bin/env python\n# coding=utf-8"
setup = """
from setuptools import setup, find_packages

setup(
	name='{project_name}',
	version='1.0.0',
	author='Peter Jiang',
	email='07jiangbin@163.com',
	description='描述信息',
	packages=find_packages(),
	# package_data={'sayhello': ['readme.txt']},
	# entry_points={
	# 	'console_scripts': [
	# 		'hello = sayhello:run'
	# 	]
	# }
)
"""


def create_project(project_name):
	split = os.path.split
	join = os.path.join
	p, f = split(__file__)
	root = join(p, project_name)
	files = [
		'docs/readme.md',
		'{project_name}/__init__.py'.format(project_name=project_name),
		'test/test.py',
		'setup.py',
		'setup.cmd'
	]
	for filename in files:
		full_filename = os.path.join(root, filename)
		path, filename = split(full_filename)
		if not os.path.exists(path):
			os.makedirs(path)
		if filename and not os.path.exists(full_filename):
			fid = open(full_filename, 'w+')
			if full_filename.endswith('.py'):
				fid.write(code)
			if full_filename.endswith('setup.py'):
				fid.write(setup.replace('{project_name}', project_name))
			fid.close()


def test():
	create_project('diujuzi')


if __name__ == "__main__":
	args = sys.argv

	if len(sys.argv) <= 1:
		test()
	else:
		project_name = sys.argv[1]
		create_project(project_name)




```