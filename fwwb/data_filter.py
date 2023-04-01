import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans

#读取Excel文件,读取三个sheet，分别为微站1，微站2，标准站
df1 = pd.read_excel('data/data.xlsx', sheet_name='微站1', header=0)
df2 = pd.read_excel('data/data.xlsx', sheet_name='微站2', header=0)
df3 = pd.read_excel('data/data.xlsx', sheet_name='标准站', header=0)
#df1df2df3以时间为索引
df1 = df1.set_index(pd.to_datetime(df1['时间']))
df2 = df2.set_index(pd.to_datetime(df2['时间']))
df3 = df3.set_index(pd.to_datetime(df3['时间']))

#找出df3比df1多的时间索引
df3_index = df3.index
df1_index = df1.index
df3_index = df3_index.drop(df1_index)

# #在df1中加入df3多出的时间索引对应的数据
# for i in df3_index:
#     df1.loc[i] = df3.loc[i]
#     #对加入的数据利用插值法进行填充
#     df1.loc[i] = df1.loc[i].interpolate()

#删除df3中多出的时间索引对应的数据
for i in df3_index:
    df3 = df3.drop(i)

df1.describe()
#对df1中的PM2.5列的数据按照时间序列画图
df1['PM2.5'].plot()
plt.show()
#对df2中的PM2.5列的数据按照时间序列画图
df2['PM2.5.1'].plot()
plt.show()
#对df3中的PM2.5列的数据按照时间序列画图
df3['PM₂.₅ μg/m³'].plot()
plt.show()
#三个图放在一个图中
df1['PM2.5'].plot()
#df2['PM2.5.1'].plot()
df3['PM₂.₅ μg/m³'].plot()
plt.show()

#df1['PM2.5'].plot()
df2['PM2.5.1'].plot()
df3['PM₂.₅ μg/m³'].plot()
plt.show()

#对df1中数据PM2.5，PM10，NO2，温度，湿度进行聚类，并且画出聚类图
df1 = df1[['时间','PM2.5', 'PM10', 'NO2', '温度', '湿度']]
kmeans = KMeans(n_clusters=3, random_state=0).fit(df1)
df1['cluster'] = kmeans.labels_
#散点图x轴为时间，y轴为PM10，颜色为聚类结果
df1.plot.scatter(x='时间', y='PM10', c='cluster', colormap='viridis')
#依据聚类结果将数据划分为不同的类
df1_0 = df1[df1['cluster'] == 0]
df1_1 = df1[df1['cluster'] == 1]
df1_2 = df1[df1['cluster'] == 2]


#将三个类的数据分别画图
# df1_0.plot.scatter(x='时间', y='PM10', c='cluster', colormap='viridis')
# plt.show()
# df1_1.plot.scatter(x='时间', y='PM10', c='cluster', colormap='viridis')
# plt.show()
# df1_2.plot.scatter(x='时间', y='PM10', c='cluster', colormap='viridis')
# plt.show()


















