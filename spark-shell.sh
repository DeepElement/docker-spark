#!/usr/bin/env bash
docker pull deepelement/docker-spark
docker run -i -t -P --link spark_master:spark_master deepelement/docker-spark /spark-shell.sh "$@"
