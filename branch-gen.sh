SPARK_VERSIONS=( '2.0.0' )
HADOOP_VERSIONS=( '2.4' )

for SPARK_VERSION in "${SPARK_VERSIONS[@]}"
do
   :
   for HADOOP_VERSION in "${HADOOP_VERSIONS[@]}"
   do
      :
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
   done
done
