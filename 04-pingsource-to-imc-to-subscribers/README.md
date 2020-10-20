Run `./run.sh`. 

* It will create a PingSource, an InMemoryChannel, a Knative Service and Subscription (channel->ksvc)
* Check logs with `stern -n ns04 .`. You will see `POST:{"message":"Thanks for doing Knative Tutorial 04"}`
