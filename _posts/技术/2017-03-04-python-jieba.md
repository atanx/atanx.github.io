---
layout: post
title: Python-使用jieba进行分词
description: Python-使用jieba进行分词
category: 技术
---

## jieba

"结巴"中文分词：做最好的Python中文分词组件 "Jieba" 

## Feature
 
支持三种分词模式：
1. 精确模式，试图将句子最精确地切开，适合文本分析；
2. 全模式，把句子中所有的可以成词的词语都扫描出来, 速度非常快，但是不能解决歧义；
3. 搜索引擎模式，在精确模式的基础上，对长词再次切分，提高召回率，适合用于搜索引擎分词。

`支持繁体分词` `支持自定义词典` 

## 在线演示
http://jiebademo.ap01.aws.af.cm/

## Python 2.x 下的安装


1. 全自动安装：`easy_install jieba` 或者 `pip install jieba`

2. 半自动安装：先下载http://pypi.python.org/pypi/jieba/ ，解压后运行`python setup.py install`

3. 手动安装：将jieba目录放置于当前目录或者site-packages目录, 通过`import jieba` 来引用 （第一次import时需要构建Trie树，需要几秒时间）

## Python 3.x 下的安装

目前master分支是只支持Python2.x 的。Python3.x 版本的分支也已经基本可用： https://github.com/fxsjy/jieba/tree/jieba3k

```sh
git clone https://github.com/fxsjy/jieba.git
git checkout jieba3k
python setup.py install
```

## Algorithm

基于Trie树结构实现高效的词图扫描，生成句子中汉字所有可能成词情况所构成的有向无环图（DAG)

采用了动态规划查找最大概率路径, 找出基于词频的最大切分组合

对于未登录词，采用了基于汉字成词能力的HMM模型，使用了Viterbi算法

## 功能 1)：分词

`jieba.cut`方法接受两个输入参数: 
1) 第一个参数为需要分词的字符串 
2) cut_all参数用来控制是否采用全模式

`jieba.cut_for_search`方法接受一个参数：需要分词的字符串,该方法适合用于搜索引擎构建倒排索引的分词，粒度比较细


> 注意：待分词的字符串可以是gbk字符串、utf-8字符串或者unicode

`jieba.cut`以及`jieba.cut_for_search`返回的结构都是一个可迭代的generator，可以使用for循环来获得分词后得到的每一个词语(unicode)，也可以用list(jieba.cut(...))转化为list

代码示例( 分词 )
```python
#encoding=utf-8
import jieba

seg_list = jieba.cut("我来到北京清华大学",cut_all=True)
print "Full Mode:", "/ ".join(seg_list) #全模式

seg_list = jieba.cut("我来到北京清华大学",cut_all=False)
print "Default Mode:", "/ ".join(seg_list) #精确模式

seg_list = jieba.cut("他来到了网易杭研大厦") #默认是精确模式
print ", ".join(seg_list)

seg_list = jieba.cut_for_search("小明硕士毕业于中国科学院计算所，后在日本京都大学深造") #搜索引擎模式
print ", ".join(seg_list)
```
Output:
```
【全模式】: 我/ 来到/ 北京/ 清华/ 清华大学/ 华大/ 大学
【精确模式】: 我/ 来到/ 北京/ 清华大学
【新词识别】：他, 来到, 了, 网易, 杭研, 大厦    (此处，“杭研”并没有在词典中，但是也被Viterbi算法识别出来了)
【搜索引擎模式】： 小明, 硕士, 毕业, 于, 中国, 科学, 学院, 科学院, 中国科学院, 计算, 计算所, 后, 在, 日本, 京都, 大学, 日本京都大学, 深造
```
## 功能 2) ：添加自定义词典

开发者可以指定自己自定义的词典，以便包含jieba词库里没有的词。虽然jieba有新词识别能力，但是自行添加新词可以保证更高的正确率

```
用法： jieba.load_userdict(file_name) # file_name为自定义词典的路径
词典格式和dict.txt一样，一个词占一行；每一行分三部分，一部分为词语，另一部分为词频，最后为词性（可省略），用空格隔开

范例：
之前： 李小福 / 是 / 创新 / 办 / 主任 / 也 / 是 / 云 / 计算 / 方面 / 的 / 专家 /
加载自定义词库后：　李小福 / 是 / 创新办 / 主任 / 也 / 是 / 云计算 / 方面 / 的 / 专家 /
```

自定义词典：https://github.com/fxsjy/jieba/blob/master/test/userdict.txt

用法示例：https://github.com/fxsjy/jieba/blob/master/test/test_userdict.py

"通过用户自定义词典来增强歧义纠错能力" --- https://github.com/fxsjy/jieba/issues/14

## 功能 3) ：关键词提取
```python
# 需要先import jieba.analyse
# setence为待提取的文本
# topK为返回几个TF/IDF权重最大的关键词，默认值为20
jieba.analyse.extract_tags(sentence,topK)
```
代码示例 （关键词提取）

https://github.com/fxsjy/jieba/blob/master/test/extract_tags.py

## 功能 4) : 词性标注

标注句子分词后每个词的词性，采用和ictclas兼容的标记法

用法示例
```python
>>> import jieba.posseg as pseg
>>> words =pseg.cut("我爱北京天安门")
>>> for w in words:
...    print w.word,w.flag
...
我 r
爱 v
北京 ns
天安门 ns
```

## 功能 5) : 并行分词

原理：将目标文本按行分隔后，把各行文本分配到多个python进程并行分词，然后归并结果，从而获得分词速度的可观提升

基于python自带的multiprocessing模块，目前暂不支持windows

用法：
```python
jieba.enable_parallel(4) # 开启并行分词模式，参数为并行进程数
jieba.disable_parallel() # 关闭并行分词模式
```
例子： https://github.com/fxsjy/jieba/blob/master/test/parallel/test_file.py

实验结果：在4核3.4GHz Linux机器上，对金庸全集进行精确分词，获得了1MB/s的速度，是单进程版的3.3倍。

## 功能 6) : Tokenize：返回词语在原文的起始位置

```
注意，输入参数只接受unicode
默认模式
result = jieba.tokenize(u'永和服装饰品有限公司')
for tk in result:
    print "word %s\t\t start: %d \t\t end:%d" % (tk[0],tk[1],tk[2])
word 永和                start: 0                end:2
word 服装                start: 2                end:4
word 饰品                start: 4                end:6
word 有限公司            start: 6                end:10
搜索模式
result = jieba.tokenize(u'永和服装饰品有限公司',mode='search')
for tk in result:
    print "word %s\t\t start: %d \t\t end:%d" % (tk[0],tk[1],tk[2])
word 永和                start: 0                end:2
word 服装                start: 2                end:4
word 饰品                start: 4                end:6
word 有限                start: 6                end:8
word 公司                start: 8                end:10
word 有限公司            start: 6                end:10
```

## 功能 7) : ChineseAnalyzer for Whoosh搜索引擎

引用： from jieba.analyse import ChineseAnalyzer

用法示例：https://github.com/fxsjy/jieba/blob/master/test/test_whoosh.py
