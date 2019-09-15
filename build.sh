#!/usr/bin/bash
export BUILD_HOME=/root/hadoop-docker-cluster

# note： build 指令最后 . 代表当前路径
# centos-jdk8
cd $BUILD_HOME/centos7+jdk8
docker build -t centos7-jdk8 .

#hadoop
cd $BUILD_HOME/hadoop
docker build -t hadoop .

#zookeeper
cd $BUILD_HOME/zookeeper
docker build -t zookeeper .

#hive
# grant all privileges on db_hive.* to 'hive'@'%' identified by 'hellohive'
cd $BUILD_HOME/hive
docker build -t hive .
# schematool -initSchema -dbType mysql

# create table test(
# id int,
# str string)
# row format delimited
# fields terminated by ',';

#spark
cd $BUILD_HOME/spark
docker build -t spark .

#hbase
cd $BUILD_HOME/hbase
docker build -t hbase .
# create 't1', {NAME => 'f1', VERSIONS => 1}, {NAME => 'f2', VERSIONS => 1}, {NAME => 'f3', VERSIONS => 1}