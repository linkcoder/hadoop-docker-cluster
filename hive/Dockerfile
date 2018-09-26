FROM hadoop

MAINTAINER linkai <lin718681@gmail.com>

#设置工作空间为root目录下
WORKDIR /root

ENV CONF_DIR=/config
ENV COMPOSE_DIR=/composes
ENV HIVE_HOME=/root/hive
ENV Hive_CONF_DIR=$HIVE_HOME/conf/

#复制配置文件到镜像中
COPY $CONF_DIR/* /tmp/

#安装hive
COPY $COMPOSE_DIR/apache-hive-2.3.2-bin.tar.gz /root/

RUN tar -zxvf /root/apache-hive-2.3.2-bin.tar.gz -C /root/ && \
	ln -s /root/apache-hive-2.3.2-bin $HIVE_HOME

COPY $COMPOSE_DIR/mysql-connector-java-5.1.27.jar $HIVE_HOME/lib

COPY $CONF_DIR/* $Hive_CONF_DIR/

RUN echo "export HIVE_HOME=$HIVE_HOME" >> /root/.bashrc && \
	echo "export PATH=\$PATH:\$JAVA_HOME/bin:\$HADOOP_HOME/bin:\$HADOOP_HOME/sbin:\$HIVE_HOME/bin" >> /root/.bashrc
