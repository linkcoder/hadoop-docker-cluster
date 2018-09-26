FROM centos7-jdk8

MAINTAINER linkai <lin718681@gmail.com>

#设置工作空间为root目录下
WORKDIR /root

ENV CONF_DIR=/config
ENV COMPOSE_DIR=/composes
ENV HBASE_HOME=/root/hbase
ENV HBASE_CONF_DIR=$HBASE_HOME/conf

#复制ssh配置
COPY ./ssh_config /root/.ssh/config
#ssh如果不执行会出现错误
RUN chmod 600 /root/.ssh/config && \
    chown root:root /root/.ssh/config

#复制配置文件到镜像中
COPY $CONF_DIR/* /tmp/

#3.安装hbase
COPY $COMPOSE_DIR/hbase-1.2.6-bin.tar.gz /root/

RUN tar -zxvf /root/hbase-1.2.6-bin.tar.gz -C /root/ && \
	mv /root/hbase-1.2.6 $HBASE_HOME && \
	rm /root/hbase-1.2.6-bin.tar.gz

COPY $CONF_DIR/* $HBASE_CONF_DIR/

RUN echo "export HBASE_HOME=$HBASE_HOME" >> /root/.bashrc && \
	echo "export PATH=\$PATH:\$JAVA_HOME/bin:\$HBASE_HOME/bin" >> /root/.bashrc

#创建hdfs目录
RUN mkdir -p /root/hbase/tmp/

#启动容器后，启动ssh服务
CMD ["sh","-c","/usr/sbin/sshd; bash"]