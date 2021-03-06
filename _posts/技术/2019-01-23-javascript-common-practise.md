---
layout: post
title: 编程共性问题
description:  编程共性问题
category: 技术
---

1. 《编写可读代码的艺术》

好的书写风格

好的命名习惯

清晰的层次结构

好的文件和目录结构


命名约定

格式约定

注释约定

结构约定 

KISS keep it simple and stupid 


作者：知乎用户

链接：https://www.zhihu.com/question/32255673/answer/55279073

来源：知乎

著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

2. 重视模块化，重视抽象但不滥用

我刚接触编程的时候，在网上看到许多大牛写程序都十分注重模块化，因此我就下意识的模仿他们；后来看SICP，知道了抽象的好处，因此在写程序的时候会仔细思考抽象的问题。这些对我都有着非常大的帮助。

在一篇讲述程序员代码行数瓶颈的博客中（程序员的成长和代码行数的关系）提到，程序员在2k行、20k行、200k行等若干程序规模时会遇到瓶颈，如果不用更科学有效的方法，超过了这个行数代码就会混乱到难以维护。但我第一次写很大的程序时（8k+）并没有感觉到文中提到的瓶颈；我目前接手的项目有近900k行，我自己写的部分也已经快上10k，但我仍然没遇到文中提到的瓶颈。

针对这一现象，我做过一些实验。我在很不认真的写一些小程序时，也总是写的混乱不堪，我发现，这种情况下，程序行数超过200行我就觉的很难受了，在需要进行一点小的修改时，我往往需要花很长时间去寻找到底该改哪里，十分吃力——这种吃力感是我在那些精心思考的大项目里从未感受过的。这说明了，我并没有过人的天赋能在混乱中轻易找出清晰的脉络，那就是说，之前的如鱼得水，是因为好的习惯。

后来，我进行了深入的思考。在模块划分合理、抽象合理的程序里，我可以简单的把一个个功能抽象为一个简单的黑盒，我不需要知道他们内部发生了什么复杂的反应，我只需要知道他们对什么样的输入会做出什么样的输出。这种抽象极大的减轻了大脑的负担，让我可以把精力更多的投入到真正需要考虑的地方。而那些混乱的程序里，我需要理清每一句话之间的关系，这无疑会极大的消耗脑力。这种情况下，200行就浑身难受就可以理解了——因为我用于维护项目关系所消耗的脑力已经远远大于了那些好程序里的消耗。

这个习惯，真的让人十分受益，请一定坚持。刚开始的时候，你或许觉得花很长时间去思考程序的模块划分、抽象层级是十分浪费时间的无用功；但久了以后，你就会感受到这种习惯带来的好处：它会在无声无息之间帮你消除掉许多瓶颈。而且还有额外的好处：当你习惯用模块化组织你的思维时，思维能力也会有一定的增强。



3 优秀的习惯

　　学习任何一门技术，在一开始就养成优秀的习惯，这是非常重要的。

　　1、看官方文档

　　遇到不清楚或不懂的知识点，先去看官方文档！

　　先！去！看！官方！！文档！！！！

　　很多官方文档是英文的，硬着头皮也要看！看着看着就习惯了。

　　刚开始读英文文档会费时间和精力，但是等你回过头来再看，你会觉得这才是最恰当的选择。

　　为什么这样讲？

　　且不说你的英文水平得到提升（这是程序员无法回避的问题），耐性得到锻炼，什么叫官方文档？！两个痣：权威！准确！当你习惯了在百度上百度一些似是而非，似懂非懂的答案时，甚至有的文章观点完全不一样，你就会懂了。

　　当然，并没有否认网上有好的答案和文章，我自己也经常看别人的博客。只是，作为初学者，你的水平很难去辨别一些文章，观点的好坏对错，而这可能会对你理解一些知识带来致命的误导！

　　所以，作为初学者，应该多读官方文档，不要浮躁，要知道任何成长都没有捷径！

　　编程规范只是一份规范，具体的实行还得看代码，推荐下载一份nginx的源代码，不一定要理解和看懂源代码，初学者从代码里了解一下nginx的编程规范还是不错的。

　　2、掌握逻辑，遵循统一原则

　　1. 不要过分纠结于“怎样把代码写得更短”或者“把代码写进一行”。

　　print filter(lambda x: len(filter(lambda y: x % y == 0, xrange(2, int(sqrt(x) + 1)))) == 0, xrange(2, 100))

　　这样的代码尼玛意义何在？

　　2.至少在同一个项目里，遵循统一的命名原则。

　　class Test(object):

　　...

　　class ShuRuTest(Test):

　　...

　　class shuchu_ceshi(Test):

　　...

　　这真不能忍……

　　3.如果有比较通用的广为接受的格式标准，请务必遵守。

　　比如Python的PEP008，比如C/C++至少有K&R（当然还有其它）……诸如此类。

　　4.代码较长时记得写好注释，整个项目写好文档。

　　几十行的小东西写个说明也好；几百几千行的不写注释维护起来太麻烦。最可恨是项目没文档，别说转手了，就自己过个小半年再来看都成了互不认识。

　　5.尽量拆分函数功能及类，保证一个函数只做一件事，不要全堆一个函数里。

　　一个函数几百行？一个函数六七重循环？呵呵……

　　6.考虑好异常处理，无论用if还是try。

　　毕竟一个RE线程就挂了，尽量考虑全可能的意外情况吧。

　　7.掌握好你所用语言的设计逻辑，或者说“世界观”。

　　真正学好用好一种语言所必须的过程。其实并不复杂，多写多总结很容易就能得到正确的理解，至少抽象层的理解务必要有。当然上手抓着本国人编写的“xx语言编程实例”照着抄来抄去然后说哇擦我懂了这种……可能性不是很大。

　　8.出现问题时，请先怀疑自己的代码。

　　在各种社区里经常会发现这样的提问：

　　“你们有谁遇到过这样的情况吗？xxxx工作不正常！我的程序绝对没有错！”

　　一口咬定自己程序没问题，然后直接就开始质疑广泛使用的库、解释器有着神奇的无数人用过都没有发现的bug……然后代码贴出来一看，几乎99%是他自己代码里的错误……



　　10.务必看懂错误提示。

　　其实是编程的最基本要求，编译器（解释器）及运行时给出的错误提示务必看懂。其实没啥难的，常见的也就那么些个单词，就那么几项概念，看明白就不用带个错误提示满世界问“哦我这个错误什么意思”这类的问题了……

　　如果你使用C语言，推荐找一份华为C语言编程规范，中文的，比较好懂。如果你使用C++语言，推荐Google的C++编程规范，也有中文翻译版。如果是C#，有Resharper插件即可。

　　3、不炫技

　　什么叫不炫技？就是能用最通用的方法解决的问题，绝不引入个人的方法，即使这个方法能突显一个程序员的逼格。因为一个程序员的逼格就意味着别的程序员智商被碾压，更多的程序员没法维护你的这段代码。而让一段代码规范且可读，是一个团队程序员的最基本的责任。

　　开源项目不是版本越新越好；

　　别人写的代码也不一定都是垃圾，不一定非要自己重构一遍；

　　不是所有模块都套上某个设计模式才能开发；

　　做优化模型的时候，不是越复杂越高大上的模型越好用，有时候组合优化和逻辑回归就能解决很多工程问题；

　　中小项目里泛型不是用的越多越好；

　　Scala的程序员不好招，Spark的项目没必要都用Scala写；

　　网站也不是都一定用node.js写才不过时。


　　在最合适的项目上用最合适的技术，不炫技，是程序员最好的习惯。

　　4、重视模块化，重视抽象但不滥用


　　在一篇讲述程序员代码行数瓶颈的博客中提到，程序员在2k行、20k行、200k行等若干程序规模时会遇到瓶颈，如果不用更科学有效的方法，超过了这个行数代码就会混乱到难以维护。

　　针对这一现象，一个在编程方面很有成就的人做过一些实验。在很不认真的写一些小程序时，也总是写的混乱不堪，这种情况下，程序行数超过200行就觉的很难受了，在需要进行一点小的修改时，往往需要花很长时间去寻找到底该改哪里，十分吃力——这种吃力感是在那些精心思考的大项目里从未感受过的。这说明了，并没有人有过人的天赋能在混乱中轻易找出清晰的脉络，那就是说，能如鱼得水，是因为好的习惯。

　　后来，进行了深入的思考。在模块划分合理、抽象合理的程序里，可以简单的把一个个功能抽象为一个简单的黑盒，不需要知道他们内部发生了什么复杂的反应，只需要知道他们对什么样的输入会做出什么样的输出。这种抽象极大的减轻了大脑的负担，可以把精力更多的投入到真正需要考虑的地方。而那些混乱的程序里，需要理清每一句话之间的关系，这无疑会极大的消耗脑力。这种情况下，200行就浑身难受就可以理解了——因为用于维护项目关系所消耗的脑力已经远远大于了那些好程序里的消耗。

　　这个习惯，真的让人十分受益，请一定坚持。刚开始的时候，你或许觉得花很长时间去思考程序的模块划分、抽象层级是十分浪费时间的无用功；但久了以后，你就会感受到这种习惯带来的好处：它会在无声无息之间帮你消除掉许多瓶颈。而且还有额外的好处：当你习惯用模块化组织你的思维时，思维能力也会有一定的增强。

　　好的习惯是成功的开始，从一开始就值得坚持。
