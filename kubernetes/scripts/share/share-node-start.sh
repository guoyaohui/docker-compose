#!/bin/bash
echo "========== 开始进行节点初始化========================="
all_k8s_node_need_execute_file_name="./share-image-execute.sh"
# 如果repo存在则删除
rm -rf /etc/yum.repos.d/kubernetes.repo

# 写入repo
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=0
EOF

# 2. 开始安装
yum -y install kubelet kubeadm kubectl kubernetes-cni

# 3. 启动kubeadm服务
systemctl enable kubelet && systemctl start kubelet

echo "安装好kubelet kubeadm kubectl kubernetes-cni"

# 4. 下载所需要的镜像
# 创建脚本 images.sh
rm -rf ${all_k8s_node_need_execute_file_name}
cat <<EOF > ${all_k8s_node_need_execute_file_name}
#!/bin/bash
images=(kube-proxy-amd64:v1.11.2 kube-scheduler-amd64:v1.11.2 kube-controller-manager-amd64:v1.11.2 kube-apiserver-amd64:v1.11.2
etcd-amd64:3.2.18 coredns:1.1.3 pause-amd64:3.1 kubernetes-dashboard-amd64:v1.8.3 k8s-dns-sidecar-amd64:1.14.9 k8s-dns-kube-dns-amd64:1.14.9
k8s-dns-dnsmasq-nanny-amd64:1.14.9 )
for imageName in \${images[@]} ; do
docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/\$imageName
docker tag registry.cn-hangzhou.aliyuncs.com/google_containers/\$imageName k8s.gcr.io/\$imageName
docker rmi registry.cn-hangzhou.aliyuncs.com/google_containers/\$imageName
done
docker tag da86e6ba6ca1 k8s.gcr.io/pause:3.1
EOF

# 添加执行权限
chmod -R 777 ${all_k8s_node_need_execute_file_name}

# 拉取所需镜像（耐心等待）
${all_k8s_node_need_execute_file_name}

echo "执行完毕${all_k8s_node_need_execute_file_name}"

# 5. 关闭 Swap
swapoff -a
# 永久关闭
#将含有swap的那一行进行注释
sed -i 's/^.*swap/#&/g' /etc/fstab

# 6. 关闭 SELinux
sed -i 's/SELINUX=permissive/SELINUX=disabled/' /etc/sysconfig/selinux

setenforce 0

# 7. 配置转发参数
cat <<EOF > /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
vm.swappiness=0
EOF

sysctl --system
echo "========== 完成进行节点初始化========================="