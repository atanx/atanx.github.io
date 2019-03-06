---
layout: post
title: Python-合成ppt图片布局
description: Python-合成ppt图片布局
category: 技术
---

最近得到一个使用python生成ppt报告的需求。在这个需求中需要插入多组图片。
由于每组图片的数量不一，最少1张，最多几十张。在ppt中展示的时候希望得到的效果
是当图片少于等于6张时，显示在同一张幻灯片中，当图片的数量大于6时，分多页显示
每页显示6张。

这时需要开发一个图片排布的算法，是的报告美观。

起初我的想法是使用网格布局。将可用区域分割成2*3(两行三列)的网格，每张图片占用一个网格。
然而测试显示效果，所有的图片都很小，尤其是当图片的宽度和高度相差较大的时候。
当图片数量较少的时候，幻灯片中大部分区域都是空白。

因此，需要改进算法。经过一番搜索，发现瀑布流的图片布局算法的灵感启发，得到了一个新的布局算法
——固定布局算法。
瀑布流的算法的核心思想是将可用区域划分成多列，将每次将图片放置在高度最短的列上。一个改进
的瀑布流算法是允许图片横跨多列。
这里我们的算法与瀑布流算法的区别在于我的高度也是有限制的。因此在瀑布流的基础上需要考虑高度。

因此我的固定布局算法的顺序是：
1. 根据图片数量，动态控制列数，1张图片使用1列，2-4张使用2列，5-n张使用3列。
2. 先仅考虑宽度显示，不考虑高度限制，将可用区域分割成多列，使用瀑布流布局，完成布局。
3. 加入高度限制，将整个布局缩放到高度限制之内。
4. 居中整个布局。


```python
#!/usr/bin/env python
# coding=utf-8

from operator import itemgetter
from PIL import Image


class ItemFrame(object):
	def __init__(self, real_width=None, real_height=None, path=''):
		"""
		
		:param real_width:  实际宽度
		:param real_height: 实际高度
		:param path:       路径
		"""
		self.width = real_width
		self.height = real_height
		self.path = path
		self.x = 0
		self.y = 0
		self._display_width = self.width
		self._display_height = self.height

	def position_with_margin(self, margin=10):
		"""
		考虑四周留白后的位置。
		:param margin: 留白宽度（px)
		:return: x: 左上角x坐标，
				y:左上角y坐标, 
				display_width: 显示宽度， 
				display_height: 显示高度
		"""
		return dict(x=self.x + margin / 2,
		y=self.y + margin / 2,
		display_width=self.display_width - margin,
		display_height=self.display_height - margin)

	@property
	def width_height_ratio(self):
		""" 宽高比 """
		return self.width * 1.0 / self.height

	@property
	def disp_width_height_ratio(self):
		""" 显示宽高比 """
		return self.display_width * 1.0 / self.display_height

	@property
	def display_width(self):
		""" 显示宽  """
		return self._display_width

	@display_width.setter
	def display_width(self, v):
		self._display_width = v
		self._display_height = v / self.width_height_ratio

	@property
	def display_height(self):
		""" 显示高  """
		return self._display_height

	@display_height.setter
	def display_height(self, v):
		self._display_width = v * self.width_height_ratio
		self._display_height = v

	def __repr__(self):
		""" print打印格式化显示。 """
		return "ItemFrame(x={x},y={y},display_width={w},display_height={h},width={rw}, height={rh})".format(
			x=self.x, y=self.y, w=self.display_width, h=self.display_height, rw=self.width, rh=self.height)


class LayOut(object):
	pass


class HorizontalLayOut(LayOut):
	"""
	横向布局
	"""
	pass


class VerticalLayOut(LayOut):
	"""
	纵向布局
	"""

	def __init__(self, total_width, column_nums):
		"""
		
		:param total_width: 总宽度(px)
		:param column_nums: 列数
		"""
		self.column_nums = column_nums
		self.column_width = total_width / column_nums
		self.column_height_list = [0] * column_nums
		self.boundary = [None, None]  # width, height
		self.items = []

	@property
	def shortest_column_idx(self):
		""" 高度最短的列的下标 """
		min_idx = 0
		for idx, height in enumerate(self.column_height_list):
			if height < self.column_height_list[min_idx]:
				min_idx = idx
		return min_idx

	def possible_position(self, max_span_num=2, mod=40):
		"""
		所有可选的图片安放位置。算法：图片不跨列的情况下，图片放置在最短列的尾部，
		如果允许跨列，则图片所占多列需有同样的高度。
		:param max_span_num: 最大占列数 
		:param mod: 单位px，模
		:return: 数组，形如[(起始列下标, 占列数),...]
		"""
		pps = []
		heights = [h / mod for h in self.column_height_list]
		min_height = min(heights)
		size = len(heights)
		for idx, h in enumerate(heights):
			for i in range(max_span_num):
				if idx + i < size and heights[idx + i] == min_height and heights[idx + i] == heights[idx]:
					pps.append((idx, i + 1))
				else:
					break
		pps = sorted(pps, key=itemgetter(1), reverse=True)
		return pps

	def add_images(self, images):
		"""
		添加图片数组。
		:param images:图片路径数组。 
		:return: 对象本身
		"""
		for image in images:
			im = Image.open(image)  # 返回一个Image对象
			item = ItemFrame(path=image, real_width=im.size[0], real_height=im.size[1])
			if item.width_height_ratio > 2:
				self.add_item(item_frame=item, max_span_num=1)
			else:
				self.add_item(item_frame=item, max_span_num=1)
		return self
	
	def add_item(self, item_frame, max_span_num=2):
		"""
		添加一个ItemFrame。
		:param item_frame: 
		:param max_span_num: 最大占列数， 默认2列。 
		:return: 
		"""
		self.items.append(item_frame)
		pps = self.possible_position(max_span_num=max_span_num)
		column_idx, span_num = pps[0]
		item_frame.x = self.column_width * column_idx
		item_frame.y = self.column_height_list[column_idx]
		item_frame.display_width = self.column_width * span_num

		for i in range(span_num):
			self.column_height_list[column_idx + i] = self.column_height_list[
				                                          column_idx + i] + item_frame.display_height
		return self

	def resize(self, ratio):
		"""
		按一定比例缩放layout。算法：重计算布局列宽，重计算ItemFrame的x，y,display_width, display_height
		:param ratio: 比例。
		:return: 
		"""
		self.column_width *= ratio
		for i in range(len(self.column_height_list)):
			self.column_height_list[i] *= ratio

		for item in self.items:
			item.x *= ratio
			item.y *= ratio
			item.display_height *= ratio  # 修改item的display_height会自动缩放计算器display_width
		return self

	@property
	def width_height_ratio(self):
		""" 计算宽高比 """
		return self.width / self.height

	@property
	def height(self):
		""" 高度属性 """
		return max(self.column_height_list)

	@height.setter
	def height(self, value):
		""" 设置高度属性 """
		old_height = self.height
		ratio = value / old_height
		self.resize(ratio)

	@property
	def used_column_nums(self):
		""" 被占用的列数。self.column_height_list中大于0的元素个数。 """
		used = map(lambda x: 1 if x > 0 else 0, self.column_height_list)
		return sum(used)

	@property
	def width(self):
		""" 被占用的宽度。"""
		return self.column_width * self.used_column_nums

	@width.setter
	def width(self, value):
		""" 重新设置占用宽度时自动计算列宽。"""
		column_width = value * 1.0 / self.used_column_nums
		ratio = column_width / self.column_width
		self.resize(ratio)

	def set_boundary(self, width, height):
		""" 
		重新设置占用宽度时自动计算列宽。
		:param width: 边界宽度
		:param height: 边界高度
		"""
		self.boundary = [width, height]
		bndr_width_height_ratio = width * 1.0 / height
		if bndr_width_height_ratio > self.width_height_ratio:
			self.height = height
		else:
			self.width = width
		return self

	def horizontal_align(self):
		"""
		居中排布。
		:return: 
		"""
		bound_width = self.boundary[0]
		width = self.width
		offset_x = (bound_width - width) / 2
		for item in self.items:
			item.x = item.x + offset_x
		return self


class FixLayOut(VerticalLayOut):

	def __init__(self, **kwargs):
		page_width = kwargs.get('page_width')
		page_height = kwargs.get('page_height')  # ppt页面高度 7.5inch
		column_num = kwargs.get('column_num')
		scale = kwargs.get('scale', 0.9)
		images = kwargs.get('images')
		super(FixLayOut, self).__init__(page_width * scale * 72, column_num)

		self.add_images(images)                         # 添加一组图片
		bound_height = page_height - 1.5                # 减去1.5
		bound_width = page_width * scale
		self.set_boundary(bound_width, bound_height)    # 设置边界
		self.horizontal_align()                         # 布局居中


if __name__ == '__main__':
	items = [ItemFrame(100, 100), ItemFrame(200, 100), ItemFrame(100, 200), ItemFrame(100, 200), ItemFrame(100, 100)]
	v_layout = VerticalLayOut(100, 3)
	for item in items:
		v_layout.add_item(item)
		print item
	print v_layout.column_height_list

	v_layout.height = 300
	print "=" * 20
	for item in items:
		print item
	print v_layout.column_height_list

```