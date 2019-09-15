# hadoop-docker-cluster
### 1.安装一下dos2unix工具
    note：yum install -y dos2unix（使用这个来转换文件格式，如果是unix系统就不用了，如果文件从Windows传入，则需要使用这个转换）

### **2.准备工作**
    安装docker
    安装docker-compose（教程在百度找一个，很好的管理工具）

### **3.脚本格式转换一下**
	需要转换的脚本是build.sh,in-container.sh

### **4.build需要的镜像**
	cd hadoop-docker-cluster && sh build.sh

### **5.初始化准备**
	需要看下每一个文件夹下面的docker-compose文件，对应挂载的目录
	看volumes属性
	eg: /root/datanode-1:/root/hdfs/datanode,需要在宿主机创建/root/datanode-1目录，也可以修改对应的目录，/root/hdfs/datanode可以不用改，这个路径是写在配置文件里面

### **6.启动容器**
	cd hadoop（或其他目录，启动哪一组容器就需要跳转到对应的目录下）
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

    启动zk
    #docker-compose up -d

    启动hbase容器
    #docker-compose up -d 
    进入hbase
    #docker exec -it hbase-master bash
    启动hbase
    #start-hbase.sh
    #进入webUI
    ip：16010

### 7.其他
	有其他问题，欢迎与我联系
	email:718681050@qq.com or lin718681@gmail.com
