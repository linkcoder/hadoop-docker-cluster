FROM centos:7

MAINTAINER linkai <lin718681@gmail.com>

#设置工作空间为root目录下
WORKDIR /root

ENV CONF_DIR=/config
ENV COMPOSE_DIR=/composes

#1.配置ssh
RUN yum install -y openssh openssh-server openssh-clients which && \
    yum clean all && \
    ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
	ssh-keygen -q -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key -N ''  && \
	ssh-keygen -q -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N '' && \
	ssh-keygen -t dsa -f /etc/ssh/ssh_host_ed25519_key -N '' 

#复制配置文件到镜像中
COPY $CONF_DIR/* /tmp/

RUN mv /tmp/ssh_config ~/.ssh/config
#ssh如果不执行会出现错误
RUN chmod 600 /root/.ssh/config && \
    chown root:root /root/.ssh/config
	
#2.安装jdk
COPY $COMPOSE_DIR/jdk-8u161-linux-x64.tar.gz /root/jdk/

RUN tar -zxvf /root/jdk/jdk-8u161-linux-x64.tar.gz -C /root/jdk/ && \
	mv /root/jdk/jdk1.8.0_161 /root/jdk/jdk8


#复制环境变量
COPY $CONF_DIR/bashrc /root/.bashrc

#启动容器后，启动ssh服务
CMD ["sh","-c","/usr/sbin/sshd; bash"]