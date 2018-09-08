#!/bin/bash
# 一、初始化k8s集群
master_init_script_file="./kubeadm-init.sh"
# 如果repo存在则删除
rm -rf ${master_init_script_file}

master_node_ip=10.88.88.201
master_node_hostname=ks-01

# 写入初始化内容
cat <<EOF > ${master_init_script_file}
kubeadm init \
--kubernetes-version=v1.11.2 \
--pod-network-cidr=10.244.0.0/16 \
--apiserver-advertise-address=0.0.0.0 \
--apiserver-cert-extra-sans=${master_node_ip},127.0.0.1,${master_node_hostname}
EOF

# 更换权限
chmod +x ${master_init_script_file}

# 初始化k8s集群
rm -rf tmp-log.out
${master_init_script_file} >> tmp-log.out
echo "执行完kubeadm init命令"
rm -rf ${master_init_script_file}

# 二、 配置kubelet认证信息
chmod 777 /etc/kubernetes/admin.conf
sed -i '/^.*KUBECONFIG.*/d/g' /etc/profile
echo "export KUBECONFIG=/etc/kubernetes/admin.conf" >> /etc/profile
source /etc/profile

# 三、配置fannell网络

# 创建安装文件夹
mkdir -p /etc/cni/net.d/

# 创建安装文件
fannel_conf_file_name="/etc/cni/net.d/10-flannel.conf"
rm -rf ${fannel_conf_file_name}
copy ./fannel/10-flannel.conf ${fannel_conf_file_name}

mkdir /usr/share/oci-umount/oci-umount.d -p
mkdir /run/flannel/
fannel_subnet_env="/run/flannel/subnet.env"
rm -rf ${fannel_subnet_env}
copy ./fannel/subnet.env ${fannel_subnet_env}

fannel_k8s_yaml="./fannel/k8s-flannel.yaml"
# 启动该网络
kubectl create -f  ${fannel_k8s_yaml}

# 四、dashboard
kubectl  -n kube-system create -f ./dashboard

dashboard_admin_file_name="./ui/dashboard-admin.yaml"
kubectl create -f ${dashboard_admin_file_name}
source /etc/profile
echo "请访问${master_node_ip}:30090以查看kubernetes的仪表盘"



