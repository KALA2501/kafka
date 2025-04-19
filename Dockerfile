FROM openjdk:11-jre-slim

# Variables
ENV KAFKA_VERSION=2.8.0 \
    SCALA_VERSION=2.13 \
    KAFKA_HOME=/opt/kafka \
    KAFKA_LISTENER_PORT=8088 \
    KAFKA_ADVERTISED_PORT=8089 \
    ZOOKEEPER_PORT=2181

# Instalar dependencias
RUN apt-get update && apt-get install -y wget net-tools dnsutils curl bash && \
    wget https://archive.apache.org/dist/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz && \
    tar -xzf kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz && \
    mv kafka_${SCALA_VERSION}-${KAFKA_VERSION} ${KAFKA_HOME} && \
    rm kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz

# Copiar el script de arranque
COPY start-kafka-zk.sh /start.sh
RUN chmod +x /start.sh

# Exponer puertos (ZK y Kafka personalizados)
EXPOSE 2181 ${KAFKA_LISTENER_PORT}

# Comando de inicio
CMD ["/start.sh"]