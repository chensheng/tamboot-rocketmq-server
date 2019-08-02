FROM openjdk:8-jdk-alpine

WORKDIR /usr/local

RUN mkdir -p rocketmq/custom-conf
COPY rocketmq-all-4.5.1-bin/ rocketmq
RUN chmod +x rocketmq/bin/*

ENV ROCKETMQ_HOME=/usr/local/rocketmq \
    JAVA_XMS=128m \
    JAVA_XMX=512m \
    JAVA_XMN=128m \
    JAVA_METASPACESIZE=64m \
    JAVA_MAXMETASPACESIZE=256m \
    NAMESRV_ADDR=localhost:9876 \
    PATH=${PATH}:/usr/local/rocketmq/bin

VOLUME $HOME/store $HOME/logs $ROCKETMQ_HOME/custom-conf