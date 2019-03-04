

---
layout: post
title: Python-使用yagmail发送邮件
description: Python-使用yagmail发送邮件
category: 技术
---

# 安装yagmail

`pip install yagmail`

# 使用
如果报错SSL，可以使用smtp_ssl=False关闭ssl。

```python
# coding=utf-8
import yagmail 

yag = yagmail.SMTP(user='07jiangbin@163.com', password='woshi110.', host='smtp.163.com', port='25', smtp_ssl=False)
body = u"老师，你好！\n <div style='color:red'>注意</div>这是最近工作的文件，请查收。"

yag.send(to='07jiangbin@163.com', subject=u'工作文件', contents=[body], attachments=['setup.py'])
print(u"已发送邮件")

```