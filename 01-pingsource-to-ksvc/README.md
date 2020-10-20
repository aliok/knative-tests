Run `./run.sh`. 

* It will create a PingSource and a Knative Service.
* Knative service will receive events from the source
* Check logs with `stern -n ns01 .`. You will see `POST:{"message":"Thanks for doing Knative Tutorial 01"}`         
