# docker-compose
自用的docker-compose的集合

### 1. .env和default.env区别
1. 在default.env中定义的变量是给container使用的。
2. 在.env中定义的变量是给docker-compose使用的。


## 一、自定义创建network
```
docker network create zookeeper-network
```



```
networks:
  default:
    external:
      name: my-pre-existing-network
```

