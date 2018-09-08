#!/bin/bash
echo "========== 开始安装17.03版本的docker-ce========================="
# 卸载旧版本数据
yum remove -y docker docker-common container-selinux docker-selinux docker-engine docker-engine-selinux
# 准备依赖组件
yum install -y yum-utils device-mapper-persistent-data lvm2
# 配置管理
yum-config-manager --enable extras
# 配置repo
rm -rf /etc/yum.repos.d/docker-ce.repo
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
# 刷新缓存
yum makecache fast
# 显示所有的docker-ce
yum list docker-ce.x86_64  --showduplicates |sort -r
# 安装17.03
yum install -y https://download.docker.com/linux/centos/7/x86_64/stable/Packages/docker-ce-selinux-17.03.3.ce-1.el7.noarch.rpm
yum install -y docker-ce-17.03.3.ce-1.el7
# 设置自启动
systemctl enable docker
# 启动
systemctl start docker
# 输出版本号
docker version
echo "========== 完成安装17.03版本的docker-ce========================="