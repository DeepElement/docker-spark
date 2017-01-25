Docker-Spark
=================================

- [Summary](#summary)
- [Usage](#usage)
- [References](#references)

# Summary
Images to support various Spark/Hadoop configurations in a [Stand-alone Cluster](http://spark.apache.org/docs/latest/spark-standalone.html) controlled by Docker.

Fetch images by schema `deepelement/docker-spark:{Spark Version}-{Hadoop Version}`.
Examples: 
- `deepelement/docker-spark:2.0.2-2.7`
- `deepelement/docker-spark:2.0.0-2.7`
- `deepelement/docker-spark:2.0.2-2.4`

Workers auto-discover `master` [Spark](http://spark.apache.org/) driver via injected network environmental variables at launch.

# Usage
To use with [Docker Compose](https://docs.docker.com/compose/), in `docker-compose.yml`:

```yaml
  spark_master:
    image: deepelement/docker-spark:2.0.2-2.7
    container_name: spark_master
    network_mode: 'bridge'
    command: /start-master.sh
    ports:
      - "7077:7077"
      - "8080:8080"

  spark_worker:
    image: deepelement/docker-spark:2.0.0-2.7
    command: /start-worker.sh
    network_mode: 'bridge'
    links:
      - spark_master
```
To scale up workers, use the standard Compose interface:

``` sh
docker-compose scale spark_worker=5
docker-compose up
```

While the Spark setup follows traditional configuration, making things less noisy is a good example of configuration override:

``` sh
RUN cp $SPARK_HOME/conf/log4j.properties.template $SPARK_HOME/conf/log4j.properties \
  && grep -rl 'log4j.rootCategory=INFO' $SPARK_HOME/conf | xargs sed -i 's/log4j.rootCategory=INFO/log4j.rootCategory=WARN/g'
```

# References

- [Docker Hub](https://hub.docker.com/r/deepelement/docker-spark/)

![Spark](http://spark.apache.org/images/spark-logo-trademark.png)![Hadoop](http://hadoop.apache.org/images/hadoop-logo.jpg)
