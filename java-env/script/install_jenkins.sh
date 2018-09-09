wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum -y install jenkins
systemctl enable jenkins
systemctl start jenkins
cat /var/lib/jenkins/secrets/initialAdminPassword

# 如果无法启动jenkins可能是因为需要自己手动配置java的路径
# vim /etc/init.d/jenkins
# 找到candidates在第一行添加我们java的安装路径，需要精确到/bin/java

# 如果时启用用户权限的问题
# vim /etc/sysconfig/jenkins
# 将用户修改为root即可