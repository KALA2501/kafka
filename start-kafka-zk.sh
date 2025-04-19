#!/bin/bash

# Inicia Zookeeper
echo "→ Iniciando Zookeeper..."
/opt/kafka/bin/zookeeper-server-start.sh /opt/kafka/config/zookeeper.properties &
sleep 5

# Inicia Kafka con listeners para productores y consumidores
echo "→ Configurando Kafka..."
echo "listeners=PLAINTEXT://0.0.0.0:8089,CONSUMER://0.0.0.0:8088" >> /opt/kafka/config/server.properties
echo "advertised.listeners=PLAINTEXT://localhost:8089,CONSUMER://localhost:8088" >> /opt/kafka/config/server.properties
echo "listener.security.protocol.map=PLAINTEXT:PLAINTEXT,CONSUMER:PLAINTEXT" >> /opt/kafka/config/server.properties
echo "inter.broker.listener.name=PLAINTEXT" >> /opt/kafka/config/server.properties

# Inicia Kafka
echo "→ Iniciando Kafka en 8089 (productores) y 8088 (consumidores)..."
/opt/kafka/bin/kafka-server-start.sh /opt/kafka/config/server.properties
