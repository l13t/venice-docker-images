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

RUN wget -q -O ${VENICE_DIR}/bin/venice-server-all.jar https://repo1.maven.org/maven2/com/venice/venice-server/${VENICE_VERSION}/venice-server-${VENICE_VERSION}-all.jar
COPY venice-server-all.jar bin/venice-server-all.jar
COPY *py bin/
COPY single-dc-configs configs/single-dc
COPY multi-dc-configs configs/multi-dc

CMD ["java", "-jar", "bin/venice-server-all.jar", "configs/single-dc"]
