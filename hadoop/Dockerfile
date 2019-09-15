FROM centos7-jdk8

MAINTAINER linkai <lin718681@gmail.com>

#设置工作空间为root目录下
WORKDIR /root

ENV CONF_DIR=/config
ENV COMPOSE_DIR=/composes
ENV HADOOP_HOME=/root/hadoop
ENV HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop/

#安装hadoop
COPY $COMPOSE_DIR/hadoop-2.7.6.tar.gz /root/

RUN tar -zxvf /root/hadoop-2.7.6.tar.gz -C /root/ && \
	mv /root/hadoop-2.7.6 $HADOOP_HOME && \
	rm /root/hadoop-2.7.6.tar.gz && \
	rm $HADOOP_HOME/bin/*.cmd && \
	rm $HADOOP_HOME/sbin/*.cmd

COPY $CONF_DIR/hadoop/* $HADOOP_CONF_DIR/

#创建hadoop的环境变量

RUN echo "export HADOOP_HOME=/root/hadoop" >> /root/.bashrc && \
	echo "export PATH=\$PATH:\$JAVA_HOME/bin:\$HADOOP_HOME/bin:\$HADOOP_HOME/sbin" >> /root/.bashrc

#创建hdfs目录
RUN mkdir -p /root/hdfs/namenode && \
	mkdir -p /root/hdfs/datanode

#启动容器后，启动ssh服务
CMD ["sh","-c","/usr/sbin/sshd; bash"]