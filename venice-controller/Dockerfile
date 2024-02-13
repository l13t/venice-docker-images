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

RUN wget -q -O ${VENICE_DIR}/bin/venice-controller-all.jar https://linkedin.jfrog.io/artifactory/venice/com/linkedin/venice/venice-controller/${VENICE_VERSION}/venice-controller-${VENICE_VERSION}-all.jar
COPY *py bin/
COPY single-dc-configs configs/single-dc
COPY multi-dc-configs configs/multi-dc

CMD ["java", "-jar", "bin/venice-controller-all.jar", "configs/single-dc/cluster.properties", "configs/single-dc/controller.properties"]
