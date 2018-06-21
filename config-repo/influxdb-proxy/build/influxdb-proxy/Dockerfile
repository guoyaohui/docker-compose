FROM golang:1.9
ADD http://p79wped4g.bkt.clouddn.com/Shanghai /etc/localtime

RUN mkdir /influxdb_proxy/ && chmod $INFLUX_WORK_DIR_PERMISSION /influxdb_proxy/
WORKDIR /influxdb_proxy/
RUN go install github.com/shell909090/influx-proxy/service && mv $GOPATH/bin/service $GOPATH/bin/influxdb-proxy

CMD $GOPATH/bin/influxdb-proxy -redis $REDIS_HOSTNAME:$REDIS_PORT