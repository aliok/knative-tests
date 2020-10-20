#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

sh ${DIR}/../common/strimzi.sh

kubectl apply -f ${DIR}/01-namespace.yaml
kubectl apply -f ${DIR}/02-sink.yaml
kubectl apply -f ${DIR}/03-source.yaml

#stern -n ns08 .

#kubectl -n kafka exec -it my-cluster-kafka-0 -- bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 \
#        --topic kafkasource-ns08 --from-beginning

# kubectl -n kafka exec -it my-cluster-kafka-0 -- bin/kafka-console-producer.sh --broker-list localhost:9092 --topic kafkasource-ns08
