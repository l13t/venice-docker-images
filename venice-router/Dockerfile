FROM  mcr.microsoft.com/openjdk/jdk:11-ubuntu

ENV VENICE_DIR=/opt/venice
ARG VENICE_VERSION

#hadolint ignore=DL3008
RUN apt-get update && \
    apt-get install --no-install-recommends tree wget python3 -y && \
    mkdir -p ${VENICE_DIR}/bin && \
    mkdir -p ${VENICE_DIR}/configs && \
    rm -rf /var/lib/apt/lists/*

WORKDIR ${VENICE_DIR}

RUN wget -q -O /opt/venice/bin/jmx_prometheus_javaagent.jar https://repo.maven.apache.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.20.0/jmx_prometheus_javaagent-0.20.0.jar && \
    wget -q -O ${VENICE_DIR}/bin/venice-router-all.jar https://linkedin.jfrog.io/artifactory/venice/com/linkedin/venice/venice-router/${VENICE_VERSION}/venice-router-${VENICE_VERSION}-all.jar
COPY *py bin/
RUN chmod +x bin/*.py
COPY single-dc-configs configs/single-dc
COPY multi-dc-configs configs/multi-dc
COPY prometheus_config.yaml /opt/venice/bin

CMD ["java", "-jar", "bin/venice-router-all.jar", "configs/single-dc/router.properties"]
