FROM  mcr.microsoft.com/openjdk/jdk:11-ubuntu

ENV VENICE_DIR=/opt/venice
ARG VENICE_VERSION

#hadolint ignore=DL3008
RUN apt-get update && \
    apt-get install --no-install-recommends -y netcat tree wget python3 && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p "${VENICE_DIR}/bin" && \
    wget -q -O ${VENICE_DIR}/bin/avro-tools.jar https://repo1.maven.org/maven2/org/apache/avro/avro-tools/1.11.2/avro-tools-1.11.2.jar && \
    wget -q -O ${VENICE_DIR}/bin/hadoop-mapreduce-client-core.jar https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-mapreduce-client-core/2.10.2/hadoop-mapreduce-client-core-2.10.2.jar && \
    wget -q -O ${VENICE_DIR}/bin/hadoop-mapreduce-client-common.jar https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-mapreduce-client-common/2.10.2/hadoop-mapreduce-client-common-2.10.2.jar && \
    wget -q -O ${VENICE_DIR}/bin/hadoop-common.jar https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-common/2.10.2/hadoop-common-2.10.2.jar

WORKDIR ${VENICE_DIR}

RUN for i in 'venice-push-job' 'venice-thin-client' 'venice-admin-tool'; do wget -q -O ${VENICE_DIR}/bin/${i}-all.jar https://repo1.maven.org/maven2/com/venice/${i}/${VENICE_VERSION}/${i}-${VENICE_VERSION}-all.jar; done

COPY sample-data sample-data
COPY run-vpj.sh .
COPY fetch.sh .
COPY create-store.sh .
COPY avro-to-json.sh .

RUN chmod +x ./*.sh

CMD ["/bin/sh", "-c", "bash"]
