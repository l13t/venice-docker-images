FROM  mcr.microsoft.com/openjdk/jdk:11-ubuntu

ENV VENICE_DIR=/opt/venice
ARG VENICE_VERSION

#hadolint ignore=DL3008
RUN apt-get update && \
    apt-get install --no-install-recommends -y netcat tree wget python3 python3-pip && \
    pip install spark-submit && \
    rm -rf /var/lib/apt/lists/*

RUN wget -q -O /tmp/spark.tgz https://dlcdn.apache.org/spark/spark-3.4.4/spark-3.4.4-bin-hadoop3.tgz && \
    mkdir /opt/spark && \
    tar -xvf /tmp/spark.tgz -C /opt/spark && \
    rm /tmp/spark.tgz

RUN mkdir -p "${VENICE_DIR}/bin" && \
    wget -q -O ${VENICE_DIR}/bin/avro-tools.jar https://repo1.maven.org/maven2/org/apache/avro/avro-tools/1.11.2/avro-tools-1.11.2.jar && \
    wget -q -O ${VENICE_DIR}/bin/hadoop-mapreduce-client-core.jar https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-mapreduce-client-core/2.10.2/hadoop-mapreduce-client-core-2.10.2.jar && \
    wget -q -O ${VENICE_DIR}/bin/hadoop-mapreduce-client-common.jar https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-mapreduce-client-common/2.10.2/hadoop-mapreduce-client-common-2.10.2.jar && \
    wget -q -O ${VENICE_DIR}/bin/hadoop-common.jar https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-common/2.10.2/hadoop-common-2.10.2.jar && \
    wget -q -O /opt/venice/bin/aws-java-sdk-bundle.jar https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.11.1034/aws-java-sdk-bundle-1.11.1034.jar && \
    wget -q -O /opt/venice/bin/hadoop-aws.jar https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/2.10.2/hadoop-aws-2.10.2.jar

WORKDIR ${VENICE_DIR}

RUN wget -q -O ${VENICE_DIR}/bin/venice-push-job-all.jar https://linkedin.jfrog.io/artifactory/venice/com/linkedin/venice/venice-push-job/${VENICE_VERSION}/venice-push-job-${VENICE_VERSION}-all.jar && \
    wget -q -O ${VENICE_DIR}/bin/venice-thin-client-all.jar https://linkedin.jfrog.io/artifactory/venice/com/linkedin/venice/venice-thin-client/${VENICE_VERSION}/venice-thin-client-${VENICE_VERSION}-all.jar && \
    wget -q -O ${VENICE_DIR}/bin/venice-admin-tool-all.jar https://linkedin.jfrog.io/artifactory/venice/com/linkedin/venice/venice-admin-tool/${VENICE_VERSION}/venice-admin-tool-${VENICE_VERSION}-all.jar

COPY sample-data sample-data
COPY run-vpj.sh .
COPY fetch.sh .
COPY create-store.sh .
COPY avro-to-json.sh .

RUN chmod +x ./*.sh

CMD ["/bin/sh", "-c", "bash"]
