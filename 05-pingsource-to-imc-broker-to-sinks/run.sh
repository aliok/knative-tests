#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

kubectl apply -f ${DIR}/01-namespace.yaml
kubectl apply -f ${DIR}/02-sink.yaml
kubectl apply -f ${DIR}/03-broker.yaml
kubectl apply -f ${DIR}/04-trigger.yaml
kubectl apply -f ${DIR}/05-source.yaml
