echo "maven.tar.gz必须要和当前的脚本放在同一个目录下"
maven_location="maven.tar.gz"
install_maven_location="/usr/java/maven/"

rm -rf ${install_maven_location}
mkdir -p ${install_maven_location}
cp ${maven_location} ${install_maven_location}
cd ${install_maven_location}
tar -zxvf ${maven_location}

# 3. 添加环境变量

sed -i '/^.*export MAVEN_HOME.*/d' /etc/profile
sed -i '/^.*export PATH=${PATH}:${MAVEN_HOME}.*/d' /etc/profile

cat << EOF >> /etc/profile
export MAVEN_HOME=${install_maven_location}apache-maven-3.5.4
export PATH=\${PATH}:\${MAVEN_HOME}/bin
EOF
# 4.立即生效
source /etc/profile

# 5. 验证安装
mvn -version