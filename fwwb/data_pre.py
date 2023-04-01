import pandas as pd
import numpy as np

#读取Excel文件
df = pd.read_excel('original_data/20221221114003_639.xlsx', sheet_name='微站数据', header=0)
#找到根据列的索引，找到空列的索引
empty_col = df.columns[df.isnull().all()]
empty_col_idx1 = df.columns.get_loc(empty_col[0])
empty_col_idx2 = df.columns.get_loc(empty_col[1])
#依据空列的索引将df划分为三组
df1 = df.iloc[:, :empty_col_idx1]
df2 = df.iloc[:, empty_col_idx1+1:empty_col_idx2]
df3 = df.iloc[:, empty_col_idx2+1:]

writer = pd.ExcelWriter('./data/data.xlsx')
df1.to_excel(writer,sheet_name="微站1",index=False)
df2.to_excel(writer,sheet_name="微站2",index=False)
df3.to_excel(writer,sheet_name="标准站",index=False)
writer.close()
#将这三个df放入写入三个sheet的函数中
# def write_excel(df, sheet_name):
#     writer = pd.ExcelWriter('./data/data.xlsx', engine='xlsxwriter')
#     df.to_excel(writer, sheet_name=sheet_name, index=False)
#     #writer.save()
#     #writer.close()
#
# write_excel(df1, '微站1')
# write_excel(df2, '微站2')
# write_excel(df3, '标准站')










