FROM redis:3.2
ADD http://p79wped4g.bkt.clouddn.com/Shanghai /etc/localtime
RUN mkdir /data-redis/ ; chmod 777 /data-redis/
ADD redis-8000.conf /data-redis/
WORKDIR /data-redis/
EXPOSE 8000

ENTRYPOINT ["redis-server", "/data-redis/redis-8000.conf"]