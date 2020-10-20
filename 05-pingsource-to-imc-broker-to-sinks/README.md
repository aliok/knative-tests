Run `./run.sh`. 

* It will create a PingSource, a Broker that uses an InMemoryChannel, a Knative Service and a Trigger (broker->ksvc)
* Check logs with `stern -n ns05 .`. You will see `POST:{"message":"Thanks for doing Knative Tutorial 05"}`
