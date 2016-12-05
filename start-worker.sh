#!/usr/bin/env bash
docker pull deepelement/docker-spark
docker run -d -t -P --link spark_master:spark_master deepelement/docker-spark /start-worker.sh "$@"
