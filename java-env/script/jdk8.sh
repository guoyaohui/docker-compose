cd /usr/
mkdir java && cd java
wget http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-x64.tar.gz

# 2. 解压安装文件
tar -zxvf jdk-8u151-linux-x64.tar.gz

# 3. 添加环境变量
cat << EOF >> /etc/profile
# 在文本最后添加如下内容
export JAVA_HOME=/usr/java/jdk1.8.0_181
export JRE_HOME=\${JAVA_HOME}/jre
export CLASSPATH=.:\${JAVA_HOME}/lib/dt.JAVA_HOME/lib/tools.jar:\${JRE_HOME}/lib
export PATH=\${JAVA_HOME}/bin:\${JRE_HOME}/bin:${PATH}
EOF
# 4.立即生效
source /etc/profile

# 5. 验证安装
java -version