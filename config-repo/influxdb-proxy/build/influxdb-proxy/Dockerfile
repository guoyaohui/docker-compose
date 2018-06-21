FROM golang:1.9
ADD http://p79wped4g.bkt.clouddn.com/Shanghai /etc/localtime
COPY run.sh /run.sh
# 文件太大，没有上传到git， 可以到该地址进行获取
COPY ./src/ /go/src/
RUN go get -d github.com/shell909090/influx-proxy/service && go install github.com/shell909090/influx-proxy/service && chmod +x /run.sh

EXPOSE 6666
CMD /run.sh
