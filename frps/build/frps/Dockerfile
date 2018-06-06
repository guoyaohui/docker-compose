FROM alpine

ADD http://p79wped4g.bkt.clouddn.com/Shanghai /etc/localtime

COPY frps-home/frps.ini /frps-home/frps.ini
COPY frps-home/frps /frps-home/frps
RUN chmod +x /frps-home/frps

WORKDIR /frps-home/

ENTRYPOINT ["./frps"]
