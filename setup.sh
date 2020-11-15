#!/usr/bin/env bash

export SOFTWARE_NAME="zookeeper" && \
export SOFTWARE_VERSION="3.6.2" && \
export DOWNLOAD_URL="http://archive.apache.org/dist/zookeeper/zookeeper-3.6.2/apache-zookeeper-3.6.2-bin.tar.gz" && \
export ARCHIVE_NAME="apache-zookeeper-3.6.2-bin.tar.gz" && \
export UNARCHIVE_NAME="apache-zookeeper-3.6.2-bin" && \
export HOME_NAME="ZOOKEEPER_HOME" && \
echo "==== 创建安装目录 ====" && \
mkdir -p ~/$SOFTWARE_NAME && \
cd ~/$SOFTWARE_NAME && \
echo "==== 下载安装文件 ====" && \
wget $DOWNLOAD_URL && \
echo "==== 解压安装文件 ====" && \
tar zxf $ARCHIVE_NAME && \
echo "==== 创建符号链接 ====" && \
ln -s $UNARCHIVE_NAME current && \
echo "==== 配置环境变量 ====" && \
(echo "export $HOME_NAME=~/$SOFTWARE_NAME/current"; echo "export PATH=\$PATH:\$$HOME_NAME/bin") >> ~/.bashrc.d/$SOFTWARE_NAME && \
source ~/.bash_profile

mkdir -p ~/zookeeper/data && \
cat > ~/zookeeper/current/conf/zoo.cfg << EOF
tickTime=2000
dataDir=~/zookeeper/data
clientPort=2181
EOF
