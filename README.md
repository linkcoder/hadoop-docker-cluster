# hadoop-docker-cluster
### **1.需要下载镜像所需要的包**
    
    jdk:jdk-8u161-linux-x64.tar.gz,这个jdk去官方下载，注意版本号对应，也可以下载新的，但要修改Dockerfile里面对应安装包的名称
    
    hadoop:https://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-2.9.0/hadoop-2.9.0.tar.gz
    
    zookeeper:https://mirrors.tuna.tsinghua.edu.cn/apache/zookeeper/zookeeper-3.4.13/zookeeper-3.4.13.tar.gz
    
    hbase:http://archive.apache.org/dist/hbase/1.2.6/hbase-1.2.6-bin.tar.gz
    
    hive:http://archive.apache.org/dist/hive/hive-2.3.2/apache-hive-2.3.2-bin.tar.gz
    
    spark:https://mirrors.tuna.tsinghua.edu.cn/apache/spark/spark-2.3.2/spark-2.3.2-bin-hadoop2.7.tgz
    
    note：yum install -y dos2unix（使用这个来转换文件格式，如果是unix系统就不用了，如果文件从Windows传入，则需要使用这个转换）

### **2.准备工作**
    
    安装docker
    安装docker-compose（教程在百度找一个，很好的管理工具）
    

### **3.构建hadoop**
    
    下载centos:7基础镜像
    #docker pull centos:7
    
    构建centos7-jdk8镜像
    #cd centos7+jdk8
    #docker build -t centos7-jdk8
    
    构建hadoop镜像
    #cd hadoop
    #docker build -t hadoop
    
    尝试启动hadoop集群
    1.创建虚拟网络
    #docker network create hadoop
    2.启动hadoop
    #docker-compose up -d
    3.进入hadoop-master容器，查看状态
    #docker exec -it hadoop-master bash
    4.第一个使用hadoop集群需要格式化namenode
    #hdfs namenode -format
    5.启动hdfs
    #start-dfs.sh
    6.启动yarn
    #start-yarn.sh
    7.查看webUI
    浏览器输入linux主机的ip：50070/ip：8088
    
### **4.构建zk集群**
    
    构建zk镜像
    #cd zookeeper
    #docker build -t zookeeper
    
    启动zk
    #docker-compose up -d

### **5.构建hbase集群**
    
    构建hbase镜像
    #cd hbase
    #docker build -t hbase
    
    启动hbase容器
    #docker-compose up -d
    
    进入hbase
    #docker exec -it hbase-master bash
    启动hbase
    #start-hbase.sh
    #进入webUI
    ip：16010

### 6.其他
需要构造spark，安装上面步骤，先构建镜像，然后使用docker-compose up -d 可以在docker-compose文件里面自己定制集群大小
以上仅作为个人主机上面构建测试的小集群，生产环境需要调优配置文件里面的一些配置
