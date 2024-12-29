import os
name = ['黑鳍金枪鱼', '金龙鱼', '孔雀鱼', '锦鲤', '虎头鲨', '海马', '金枪鱼', '龙鱼', '红鳍鱼', '黄鳍鱼', '月光鱼', '飞鱼', '草鱼', '红目鲢', '银龙鱼', '石斑鱼', '大西洋鳕鱼', '魔鬼鱼', '螳螂鱼', '黑石斑鱼']
for e in name:
  folder_path = r"D:\FishManage\media\banners\yu\{e}".format(e=e)
  folder_path = folder_path.replace("\x08", "")  # 移除退格符或其他非法字符
  print(folder_path)
  file_names = [os.path.basename(f) for f in os.listdir(folder_path) if os.path.isfile(os.path.join(folder_path, f))]

  print(file_names)