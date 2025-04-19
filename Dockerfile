FROM openjdk:11-jre-slim

WORKDIR /opt

RUN apt-get update && \
    apt-get install -y wget curl bash net-tools dnsutils && \
    wget https://archive.apache.org/dist/kafka/2.8.0/kafka_2.13-2.8.0.tgz && \
    tar -xzf kafka_2.13-2.8.0.tgz && \
    mv kafka_2.13-2.8.0 kafka && \
    rm kafka_2.13-2.8.0.tgz

COPY start-kafka-zk.sh /start.sh
RUN chmod +x /start.sh

WORKDIR /opt/kafka

ENTRYPOINT ["/start.sh"]