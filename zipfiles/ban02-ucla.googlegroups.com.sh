#!/bin/bash

# 下载文件
echo "正在下载文件..."
curl -L https://github.com/lulexyz/somescript/blob/main/zipfiles/ban02-ucla.googlegroups.com-100.zip?raw=true > file.zip

# 提示输入密码
echo "请输入密码："
read password

# 解压缩文件
echo "正在解压缩文件..."
unzip -P $password file.zip -d /root/sa/

# 删除下载的压缩文件
echo "正在删除压缩文件..."
rm file.zip

echo "解压缩完成。"
