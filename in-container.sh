#!/bin/bash

inhadoop(){
	echo "welcome to hadoop-master"
	docker exec -it hadoop-master /bin/bash
}

inhive(){
	echo "welcome to hive"
	docker exec -it hive-s1 /bin/bash
}

inspark(){
	echo "welcome to spark-master"
	docker exec -it spark-master /bin/bash
}

inhbase(){
	echo "welcome to hbase-master"
	docker exec -it hbase-master /bin/bash
}

inzookeeper(){
	echo "welcome to zoo1"
	docker exec -it zoo1 /bin/bash
}

inmysql(){
	echo "welcome to mysql"
	docker exec -it mysql /bin/bash
}

echo "!!! welcome to hadoop world  !!!   "

while true
do
	
	echo "==select a container to exec =="
	echo "      [1] hadoop-master        "
	echo "      [2] hive                 "
	echo "      [3] spark-master         "
	echo "      [4] hbase                "
	echo "      [5] zookeerper           "
	echo "      [6] inmysql           "
	echo "      [0] exit                 "
	echo "==============================="
	read option

	case ${option} in
		1) inhadoop
		;;
		2) inhive
		;;
		3) inspark
		;;
		4) inhbase
		;;
		5) inzookeeper
		;;
		6) inmysql
		;;
		*) exit 0
		;;
	esac

done

