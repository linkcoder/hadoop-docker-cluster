FROM centos7-jdk8

MAINTAINER linkai <lin718681@gmail.com>

WORKDIR /root

ENV CONF_DIR=/config
ENV COMPOSE_DIR=/composes
ENV ZK_HOME=/root/zookeeper

COPY $COMPOSE_DIR/* /root/

#安装zk
RUN tar -zxvf /root/zookeeper-3.4.13.tar.gz -C /root/ && \
	mv /root/zookeeper-3.4.13 $ZK_HOME && \
	rm /root/zookeeper-3.4.13.tar.gz
	
#创建环境变量
RUN echo "export ZK_HOME=$ZK_HOME" >> /root/.bashrc && \
	echo "export PATH=\$PATH:\$JAVA_HOME/bin:\$ZK_HOME/bin" >> /root/.bashrc

#创建数据文件夹
RUN mkdir -p $ZK_HOME/data

#复制配置文件
ADD $CONF_DIR/* $ZK_HOME/conf

EXPOSE 2181

CMD ["sh", "-c", "source /root/.bashrc && $ZK_HOME/bin/zkServer.sh start; bash"]


