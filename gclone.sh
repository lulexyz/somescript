#!/bin/bash

if [ $(id -u) -ne 0 ]; then
    echo "必须以root用户身份运行此脚本！"
    exit 1
fi

if ! command -v unzip >/dev/null 2>&1 ; then
    echo "未检测到 unzip 命令，正在安装..."
    apt-get update
    apt-get install -y unzip
fi

if ! command -v curl >/dev/null 2>&1 ; then
    echo "未检测到 curl 命令，正在安装..."
    apt-get update
    apt-get install -y curl
fi

# 获取操作系统和架构信息
OS="$(uname | tr '[:upper:]' '[:lower:]')"
ARCH="$(uname -m)"

# 根据操作系统和架构选择下载URL
case "$ARCH" in
    "x86_64")
        ARCH="amd64"
        ;;
    "aarch64")
        ARCH="arm64"
        ;;
    *)
        echo "Unsupported architecture: $ARCH"
        exit 1
        ;;
esac

case "$OS" in
    "linux")
        OS="linux"
        ;;
    "darwin")
        OS="osx"
        ;;
    *)
        echo "Unsupported operating system: $OS"
        exit 1
        ;;
esac

# 设置发行包下载URL
GCLONE_URL="https://github.com/l3v11/gclone/releases/download/v1.62.2-purple//gclone-v1.62.2-purple-${OS}-${ARCH}.zip"

# 下载并解压gclone发行包
echo "Downloading gclone from: $GCLONE_URL"
curl -L "$GCLONE_URL" -o gclone.zip
unzip  gclone.zip

# 将gclone移动到 /usr/local/bin/ 并给予执行权限
mv gclone-v1.62.2-purple-${OS}-${ARCH}/gclone /usr/local/bin/
chmod +x /usr/local/bin/gclone

# 清理
rm -f gclone.zip
rm -rf gclone-v1.62.2-purple-${OS}-${ARCH}

echo "Gclone has been installed successfully."
