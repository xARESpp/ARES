import pandas as pd

# 数据定义
data = {
    "序号": [1, 2, 3, 4, 5, 6],
    "字段名称": ["学号", "姓名", "性别", "出生日期", "专业", "学院编号"],
    "数据类型": ["char", "varchar", "char", "date", "varchar", "char"],
    "长度": [10, 40, 2, 8, 40, 5],
    "小数位": ["", "", "", "", "", ""],
    "主键": ["是", "", "", "", "", ""],
    "外键": ["", "", "", "", "是", "是"],
    "允许空": ["否", "否", "否", "否", "否", "否"],
    "默认值": ["", "", "", "", "", ""],
    "说明": ["", "", "", "", "", ""],
}

# 创建DataFrame
df = pd.DataFrame(data)

# 显示表格
import ace_tools as tools; tools.display_dataframe_to_user(name="表设计结构示例", dataframe=df)
