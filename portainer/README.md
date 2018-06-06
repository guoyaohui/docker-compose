在volumes中映射的一行不允许更改
在linux用户时，默认安装的docker则一定要映射为
```
/var/run/docker.sock:/var/run/docker.sock
```

2. 如果portainer没有启动成功的话，需要使用sudo rm -rf 手动把data-volumes目录的所有的数据全部清空，然后重新启动。否则访问的时候可能会报错
