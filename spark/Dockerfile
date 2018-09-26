FROM centos7-jdk8

MAINTAINER linkai <linkai718681@gmail.com>

WORKDIR /root

ENV CONF_DIR=/config
ENV COMPOSE_DIR=/composes
ENV SPARK_HOME=/root/spark

#复制ssh配置
COPY ./ssh_config /root/.ssh/config
#ssh如果不执行会出现错误
RUN chmod 600 /root/.ssh/config && \
    chown root:root /root/.ssh/config

#复制spark安装包
COPY $COMPOSE_DIR/spark-2.3.2-bin-hadoop2.7.tgz /root/

#安装spark
RUN tar -zxvf /root/spark-2.3.2-bin-hadoop2.7.tgz -C /root/ && \
	mv /root/spark-2.3.2-bin-hadoop2.7 $SPARK_HOME && \
	rm /root/spark-2.3.2-bin-hadoop2.7.tgz

#配置环境变量
RUN echo "export SPARK_HOME=$SPARK_HOME" >> /root/.bashrc && \
	echo "export PATH=\$PATH:\$JAVA_HOME/bin:\$SPARK_HOME/bin:\$SPARK_HOME/sbin" >> /root/.bashrc

#复制配置文件
COPY $CONF_DIR/* $SPARK_HOME/conf/
	
#启动容器后，启动ssh服务
CMD ["sh","-c","/usr/sbin/sshd; bash"]
	
