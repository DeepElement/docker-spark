run() {
    SPARK_VERSION=$1
    HADOOP_VERSION=$2
    echo $SPARK_VERSION-$HADOOP_VERSION

    git fetch
    git branch $SPARK_VERSION-$HADOOP_VERSION
    git checkout $SPARK_VERSION-$HADOOP_VERSION
    git reset --hard origin/master
    sed -i -e "s/{SPARK_VERSION}/$SPARK_VERSION/" Dockerfile
    sed -i -e "s/{HADOOP_VERSION}/$HADOOP_VERSION/" Dockerfile
    git add Dockerfile
    git commit -m "Dockerfile udpate"
    git tag -d $SPARK_VERSION-$HADOOP_VERSION
    git push --set-upstream origin $SPARK_VERSION-$HADOOP_VERSION -f
    git clean -df

    # reset master
    git checkout master

}

run '2.0.0' '2.3'
run '2.0.0' '2.4'
run '2.0.0' '2.6'
run '2.0.0' '2.7'
run '2.0.1' '2.3'
run '2.0.1' '2.4'
run '2.0.1' '2.6'
run '2.0.1' '2.7'
run '2.0.2' '2.3'
run '2.0.2' '2.4'
run '2.0.2' '2.6'
run '2.0.2' '2.7'
run '2.1.0' '2.3'
run '2.1.0' '2.4'
run '2.1.0' '2.6'
run '2.1.0' '2.7'
run '2.1.1' '2.3'
run '2.1.1' '2.4'
run '2.1.1' '2.6'
run '2.1.1' '2.7'
run '2.1.7' '2.3'
run '2.1.7' '2.4'
run '2.1.7' '2.6'
run '2.1.7' '2.7'