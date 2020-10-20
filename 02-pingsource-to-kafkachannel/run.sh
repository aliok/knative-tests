#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

sh ${DIR}/../common/strimzi.sh

kubectl apply -f ${DIR}/01-namespace.yaml
kubectl apply -f ${DIR}/02-config-kafka.yaml
kubectl apply -f ${DIR}/03-sink.yaml
kubectl apply -f ${DIR}/04-source.yaml
