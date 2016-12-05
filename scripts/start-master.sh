#!/usr/bin/env bash
export SPARK_MASTER_IP=`hostname -i`
export SPARK_LOCAL_IP=`hostname -i`
/usr/local/spark/sbin/start-master.sh --properties-file /spark-defaults.conf -i $SPARK_LOCAL_IP "$@"
/bin/bash
tail -f /dev/null
