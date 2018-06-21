FROM stilliard/pure-ftpd:latest
ENV LANG C.UTF-8
ADD http://p79wped4g.bkt.clouddn.com/Shanghai /etc/localtime
CMD /run.sh -c $MAXCLENTSNUMBER -C $MAXCLIENTSPERIP -l $LOGIN -E -j -R -P $PUBLICHOST -p $FTP_PASSIVE_PORTS