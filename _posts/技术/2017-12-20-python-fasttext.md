---
layout: post
title: Python-使用fasttext进行文本分类
description: Python-使用fasttext进行文本分类
category: 技术


### 安装

- 系统要求linux/Mac
- GCC 4.7+


### 使用fastText进行文本分类demo

- 测试环境：master(172.16.0.30) 
- 路径/app/bi/jiangb/sloganClassify
- 训练集data.txt


#### 1. 训练模型

训练数据data形如：
```
    1 把 1000 首歌 装 到 口袋 里 。 __label__slogan
    2 唯一 的 不同 ， 是 处处 都 不同 。 __label__slogan
    3 喝 杯水 都 可 感知 的 精准 。 __label__slogan
    4 一面 科技 ， 一面 艺术 。 __label__slogan
    5 就算 是 家人 ， 也 要 继续 当 恋人 。 __label__slogan
    6 世界 上 有 一种 专门 拆散 亲子关系 的 怪物 ， 叫做 长大 。 __label__slogan
    7 所有 的 光芒 ， 都 需要 时间 才能 被 看到 。 __label__slogan
    8 那些 别人 眼中 的 天真 ， 都 是 我 以梦为 马 的 狂奔 。 __label__slogan
    9 它 很丑 ， 但 它 能带 你 到 想 去 的 地方 。 __label__slogan
   10 了解 世界 的 两种 方式 ， 翻墙 或者 MINI 。 __label__slogan
   11 越是 强手 ， 越是 喜欢 强有力 的 对手 。 __label__slogan
   12 世界 上 最 重要 的 一部 车是 爸爸 的 肩膀 。 __label__slogan
   13 酒 ， 两个 人分 着 喝 就 会 觉得 更 暖 。 __label__slogan
   14 第一次 和 父亲 喝酒 ， 喝 的 是 小时候 父亲 在 家里 喝 的 那种 酒 。 __label__slogan
   15 没有 酒鬼 ， 只有 胆小鬼 。 __label__slogan

```

模型训练代码
```python
import fasttext
import sys 


reload(sys)
sys.setdefaultencoding('utf-8')

c = fasttext.supervised('data.txt', 'data.model', label_prefix='__label__')

```


#### 2. 预测
```python
#!/usr/bin/env python
# coding=utf-8

import fasttext
import sys
import jieba


reload(sys)
sys.setdefaultencoding('utf-8')

# 导入模型
c = fasttext.load_model('data.model.bin', label_prefix='__label__')

# 使用测试集数据测试模型
# r = c.test('data.txt')  # 测试 测试集数据
# print r.precision, r.recall  # 输出模型在测试集上的准确率和召回率


# 对指定句子进行预测
sentences = [u'重阳节日喜登高，思乡游子盼归巢',
			 u'你的眼神里，有涟漪，有落下的疼',
			 u'水洗的天空牵引我      延伸的远',
			 u'找灵感数据管理后台',
			 u'在无涯的时光中，我目空一切地走来',
			 u'用自己的生命',
			 u'再忙,也要和你喝杯咖啡 ']
sentences = [u' '.join(jieba.cut(s)) for s in sentences]
for s in sentences:
	print s
	print c.predict_proba([s])[0]
	print


```