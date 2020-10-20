Run `./run.sh`. 

* It will install Strimzi
* It will create a PingSource and a KafkaChannel
* KafkaChannel will receive events from the source
* Check Kafka topic by running the following command, you need to see `{"message":"Thanks for doing Knative Tutorial 02"}` every minute:

```yaml 
kubectl -n kafka exec -it my-cluster-kafka-0 -- bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 \
        --topic knative-messaging-kafka.ns02.kafkachannel --from-beginning
```         
