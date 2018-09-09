java_linux="jdk-8u65.tar.gz"
install_file_dir="/usr/java/8/"

rm -rf ${install_file_dir}
mkdir -p ${install_file_dir}
cp ${java_linux} ${install_file_dir}
cd ${install_file_dir}
tar -zxvf ${java_linux}

# 3. 添加环境变量

sed -i '/^.*export JAVA_HOME.*/d' /etc/profile
sed -i '/^.*export JRE_HOME.*/d' /etc/profile
sed -i '/^.*export CLASSPATH.*/d' /etc/profile
sed -i '/^.*export PATH=\${JAVA_HOME}/bin:\${JRE_HOME}/bin:${PATH}.*/d' /etc/profile

cat << EOF >> /etc/profile
export JAVA_HOME=${install_file_dir}jdk1.8.0_65
export JRE_HOME=\${JAVA_HOME}/jre
export CLASSPATH=.:\${JAVA_HOME}/lib/dt.JAVA_HOME/lib/tools.jar:\${JRE_HOME}/lib
export PATH=\${JAVA_HOME}/bin:\${JRE_HOME}/bin:${PATH}
EOF
# 4.立即生效
source /etc/profile

# 5. 验证安装
java -version
