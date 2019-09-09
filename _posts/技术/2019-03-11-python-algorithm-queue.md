---
layout: post
title: python常用的数据结构2-队列
description: python常用的数据结构2-队列
category: 技术
---

## 什么是队列
`队列`是一种先进先出(FIFO)的数据结构。

## 队列的抽象数据类型

1. Q.enqueue(e)  # 向队列Q的队列尾部添加一个元素
2. Q.dequeue()   # 从队列Q中移除并返回第一个元素，如果队列为空，触发一个错误
3. Q.first()     # 在不移除的情况下，返回队列的第一个元素
4. Q.is_empty() # 判断队列是否为空
5. len(Q)       # 返回队列长度

## 队列的Python实现
```python


```