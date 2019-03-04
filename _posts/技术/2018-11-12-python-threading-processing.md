---
layout: post
title: Python-多线程和多进程
description: Python-多线程和多进程
category: 技术
---

## 多线程

1. setDameon(True) 设置守护进程，守护进程最后退出
2. join() 阻塞主线程
3. join(3) 阻塞主线程3s,主线程结束，子线程仍会继续执行至完成
4. setDameon(True) join()同时使用时，主线程结束，子线程也结束。



## 多进程

```python
## 示例1
```python
#!/usr/bin/env python
#coding=utf-8

from  multiprocessing import Pool, Queue
import os, time,random


def do_task(name):
	print "Run task {name}".format(name=name)
	st = time.time()
	time.sleep(3)
	et = time.time()
	print "Task {name} runs {dur} seconds".format(name=name, dur=et-st)

if __name__ == '__main__':
	print "Parent process {pid}".format(pid=os.getpid())
	p=Pool(4)
	for i in range(5):
		p.apply_async(do_task, args=(i,))
	p.close()
	p.join()
	print('All subprocesses donw')


```

## 示例2
```python
from multiprocessing import Process, Queue
import os, time, random

# 写数据进程执行的代码:
def write(q):
    print('Process to write: %s' % os.getpid())
    for value in ['A', 'B', 'C']:
        print('Put %s to queue...' % value)
        q.put(value)
        time.sleep(random.random())

# 读数据进程执行的代码:
def read(q):
    print('Process to read: %s' % os.getpid())
    while True:
        value = q.get(True)
        print('Get %s from queue.' % value)

if __name__=='__main__':
    # 父进程创建Queue，并传给各个子进程：
    q = Queue()
    pw = Process(target=write, args=(q,))
    pr = Process(target=read, args=(q,))
    # 启动子进程pw，写入:
    pw.start()
    # 启动子进程pr，读取:
    pr.start()
    # 等待pw结束:
    pw.join()
    # pr进程里是死循环，无法等待其结束，只能强行终止:
    pr.terminate()
```
```