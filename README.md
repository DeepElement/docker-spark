Docker-Spark
=================================

- [Summary](#summary)
- [Usage](#usage)
- [References](#references)

# Summary
Images to support various Spark/Hadoop configurations in a local cluster controlled by Docker.

Fetch images by schema `deepelement/docker-spark:{Spark Version}-{Hadoop Version}`.
Examples: 
- `deepelement/docker-spark:2.0.2-2.7`
- `deepelement/docker-spark:2.0.0-2.7`
- `deepelement/docker-spark:2.0.2-2.4`

# Usage
To use with [Docker Compose](https://docs.docker.com/compose/), drop this in `docker-compose.yml` file:

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

# References

- [Docker Hub](https://hub.docker.com/r/deepelement/docker-spark/)
