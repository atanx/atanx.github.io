---
layout: post
title: Python-使用win32com处理word文件
description: Python-使用win32com处理word文件
category: 技术
---


### word
安装第三方库win32com，windows系统可用。

```python
# coding=utf-8 
import win32com
from win32com.client import Dispatch, DispatchEx
word = Dispatch('Word.Application')  # 打开word应用程序
# word = DispatchEx('Word.Application') #启动独立的进程
word.Visible = 0  # 后台运行,不显示
word.DisplayAlerts = 0  # 不警告

def read_doc(filename):
    content = ""
    doc = word.Documents.Open(FileName=filename, Encoding='gbk')
    # content = doc.Range(doc.Content.Start, doc.Content.End)
    # content = doc.Range() 
    #print '段落数: ', doc.Paragraphs.count  
    for para in doc.paragraphs:
        content = content + para.Range.text 
    
    doc.Close() 
    return content
    
#p = "Z:/01、结案项目/上海-长甲-长泰淀湖观园2013/05出品价值/2013年5月/0514长泰淀湖观园软文.docx"
#p = "Z:/01、结案项目/长沙-复地-崑玉国际2013/04管理文件/工作任务单/2013年3月/长沙20130329-01.doc"
p = "Z:/01、结案项目/上海-协信天地2013/03过程文件包/2013年6月/20130613中环协信天地年度策略提报/20130613.docx"
print read_doc(p.decode('utf-8').encode('gbk'))


################################
def read_doc(filename):
    content = ""
    doc = word.Documents.Open(FileName=filename, Encoding='gbk')
    # content = doc.Range(doc.Content.Start, doc.Content.End)
    # content = doc.Range() 
    #print '段落数: ', doc.Paragraphs.count  
    for para in doc.paragraphs:
        content += "\n" + para.Range.text  
    doc.Close() 
    return content
    
#p = "Z:/01、结案项目/上海-长甲-长泰淀湖观园2013/05出品价值/2013年5月/0514长泰淀湖观园软文.docx"
#p = "Z:/01、结案项目/长沙-复地-崑玉国际2013/04管理文件/工作任务单/2013年3月/长沙20130329-01.doc"
p = "Z:/01、结案项目/上海-协信天地2013/03过程文件包/2013年6月/20130613中环协信天地年度策略提报/20130613.docx"
c = read_doc(p.decode('utf-8').encode('gbk'))
print c
```


```python

from docx import Document
def read_docx(file_name):
    doc = Document(file_name)
    content = '\n'.join([para.text for para in doc.paragraphs])
    return content

p = "Z:/01、结案项目/上海-长甲-长泰淀湖观园2013/05出品价值/2013年5月/0514长泰淀湖观园软文.docx"
print read_docx(p.decode('utf-8').encode('gbk'))


```

