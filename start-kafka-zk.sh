#!/bin/bash

# Inicia Zookeeper
echo "→ Iniciando Zookeeper..."
/opt/kafka/bin/zookeeper-server-start.sh /opt/kafka/config/zookeeper.properties &

# Espera que Zookeeper esté disponible
echo "Esperando 5s para Zookeeper..."
sleep 5

# Inicia Kafka (usando el server.properties que ya copiaste correctamente)
echo "→ Iniciando Kafka..."
/opt/kafka/bin/kafka-server-start.sh /opt/kafka/config/server.properties
