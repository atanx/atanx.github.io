---
layout: post
title: python常用的数据结构4-位置列表
description: python常用的数据结构4-位置列表
category: 技术
---

## 什么是双端队列
`队列`是一种先进先出(FIFO)的数据结构。

## 双端队列的抽象数据类型

1. Q.add_first(e)  # 向双端队列前面添加一个元素e
2. Q.add_last(e)   # 向双端队列后面添加一个元素e
3. Q.delete_first()     # 头部移除并返回一个元素，若为空触发一个错误
4. Q.delete_last() # 尾部移除并返回一个元素，若为空触发一个错误
5. D.first()
6. D.last()
7. D.is_empty()  # 判断双端队列是否为空
8. len(Q)       # 返回队列长度

## 双端队列的Python实现
```python

```