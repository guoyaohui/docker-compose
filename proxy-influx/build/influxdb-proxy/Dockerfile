FROM alpine
ADD http://p79wped4g.bkt.clouddn.com/Shanghai /etc/localtime

COPY main /main
COPY run.sh /run.sh

RUN chmod +x /main && chmod +x /run.sh
# 文件太大，没有上传到git， 可以到该地址进行获取
EXPOSE 6666
CMD /run.sh
