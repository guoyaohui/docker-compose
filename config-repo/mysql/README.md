1. 注意
mysql-服务尽量不要设置restart: always
原因是: 在docker for win中，如果强行关闭docker for win，然后再重新启动docker for win的时候，会加载不到数据文件，我的数据文件大概是4G左右