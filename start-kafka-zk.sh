#!/bin/bash

echo "→ Iniciando Zookeeper..."
$KAFKA_HOME/bin/zookeeper-server-start.sh $KAFKA_HOME/config/zookeeper.properties &
sleep 5

echo "→ Configurando Kafka..."
KAFKA_CONFIG="$KAFKA_HOME/config/server.properties"
sed -i "s|^listeners=.*|listeners=PLAINTEXT://0.0.0.0:$KAFKA_LISTENER_PORT|" $KAFKA_CONFIG
sed -i "s|^#advertised.listeners=.*|advertised.listeners=PLAINTEXT://localhost:$KAFKA_ADVERTISED_PORT|" $KAFKA_CONFIG

echo "→ Iniciando Kafka en $KAFKA_LISTENER_PORT (anunciado como $KAFKA_ADVERTISED_PORT)..."
$KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_CONFIG
