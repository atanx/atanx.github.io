---
layout: post
title: Python-使用pandas进行数据分析
description: Python-使用pandas进行数据分析
category: 技术

# DataFrame
---
1. `iat`只能访问单个值，速度快
2. `iloc`可以访问一个区域
3. `ix` 可以混用index和下标进行切片


```python
import pandas as pd
import numpy as np

dates = pd.date_range('20130101',periods=6)
df = pd.DataFrame(np.random.randn(6,4),index=dates,columns=list('ABCD'))

# 增
df['E'] = np.nan  # 使用nan值增加一列
df2 = df.append(df.iloc(3), ignore_index=True)  # 增加一行

# 删
# 通过 .ix切片实现

# 改
df.ix[0,0] = 100
df.ix[0,:] = np.random.randn(1, len(df.columns))  # 修改一行
df.ix[:, 1] = np.ranom.randn(len(df.index), 1)  # 修改一列

# 查
df.A  # 查一列
df['A']  # 查一列

df.at[dates[0], 'A']  # 通过label查某一个值
df.iat[0,0]  # 通过下标查某一个值

df.loc[dates[0], :]  # 通过label切片
df.iloc[0,:]  # 通过下标切片

df.ix[dates[0:3], 0:2]  # 通过label、下标混合方式切片


```

```python
df.from_dict()
df.read_csv(filename, encoding='gbk')
df.read_excel(filename, 'Sheet1', index_col=None, na_value=['NA'])
df.to_csv(filename, encoding='gbk')
df.to_excel()

```