#!/usr/bin/env bash
docker pull deepelement/docker-spark
docker run -d -t -P --name spark_master deepelement/docker-spark /start-master.sh "$@"
