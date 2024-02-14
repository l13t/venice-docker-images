#!/bin/bash

hadoop_jars="/opt/venice/bin/hadoop-mapreduce-client-core.jar:/opt/venice/bin/hadoop-mapreduce-client-common.jar:/opt/venice/bin/hadoop-common.jar:/opt/venice/bin/hadoop-aws.jar:/opt/venice/bin/aws-java-sdk-bundle.ja"
vpj_jar="/opt/venice/bin/venice-push-job-all.jar"

java -cp "$hadoop_jars:$vpj_jar" com.linkedin.venice.hadoop.VenicePushJob $1
