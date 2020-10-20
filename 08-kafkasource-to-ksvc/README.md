Run `./run.sh`. 

* It will install Strimzi
* It will create a KafkaSource and a Knative Sevice
* KafkaSource will post events to the Knative Service
* Produce messages by doing following:
```yaml 
kubectl -n kafka exec -it my-cluster-kafka-0 -- bin/kafka-console-producer.sh --broker-list localhost:9092 --topic kafkasource-ns08
```
* Check Knative Service logs by doing `stern -n ns08 .`. You will see the messages you produce in the logs.
