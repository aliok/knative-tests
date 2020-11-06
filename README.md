- Install Knative Serving 0.17 by running `0.17.3-01-kn-serving.sh`
- Install Knative Eventing 0.17 by:
```
kubectl apply -f https://github.com/knative/eventing/releases/download/v0.17.8/eventing.yaml
kubectl apply -f https://github.com/knative/eventing/releases/download/v0.17.8/eventing-post-install-jobs.yaml
```
- Install Knative Kafka 0.17 by:
```
kubectl apply -f https://github.com/knative/eventing-contrib/releases/download/v0.17.7/kafka-channel.yaml
kubectl apply -f https://github.com/knative/eventing-contrib/releases/download/v0.17.7/kafka-source.yaml
```

Because of https://github.com/knative/eventing-contrib/issues/1659, edit the config-kafka configmap in knative-eventing:
```
bootstrapServers: my-cluster-kafka-bootstrap.kafka:9092
```

- Run all examples
```
./01-pingsource-to-ksvc/run.sh
...
./xx-abcdef/run.sh
```

- Upgrade Serving to 0.18 by running `0.18.1-01-kn-serving.sh`

- Upgrade Eventing + Kafka to 0.18:
```
kubectl apply -f https://github.com/knative/eventing/releases/download/v0.18.4/eventing-pre-install-jobs.yaml
kubectl apply -f https://github.com/knative/eventing/releases/download/v0.18.4/eventing.yaml
kubectl apply -f https://github.com/knative/eventing-contrib/releases/download/v0.18.3/kafka-channel.yaml
kubectl apply -f https://github.com/knative/eventing-contrib/releases/download/v0.18.3/kafka-source.yaml
```

- Again, because of https://github.com/knative/eventing-contrib/issues/1659, edit the config-kafka configmap in knative-eventing:
```
bootstrapServers: my-cluster-kafka-bootstrap.kafka:9092
```   

- Check the instructions in individual directories to see if things are still running

Issues found:
- `kubectl apply -f https://github.com/knative/eventing/releases/download/v0.18.4/eventing.yaml` says 
"The Deployment "pingsource-mt-adapter" is invalid: spec.template.spec.containers[0].env[0].valueFrom: Invalid value: "": may not be specified when "value` is not empty"
Fix: https://github.com/knative/eventing/pull/4472
- Same shit for KafkaChannel dispatcher deployment
https://github.com/knative/eventing-contrib/pull/1660
- Not really related to upgrade, I found this:
https://github.com/knative/eventing-contrib/issues/1659
JIRA: https://issues.redhat.com/browse/SRVKE-631 
