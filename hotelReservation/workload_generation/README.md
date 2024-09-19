# Set up #

Prerequisite:
Must have all of the microservice pods running for the Hotel Reservation in the DeathStarBenchmark.
To do this:

```
kubectl apply -Rf <path-of-repo>/hotelReservation/kubernetes/
```
Ensure the setup works by:
* checking that the all the pods are running (``` kubectl get pods ```)

## Run Benchmark ##
```
kubectl apply -f benchmark_role.yaml 
kubectl apply -f peaks-hr-client.yaml
```
Ensure the setup works by:
* check that the pod is running (``` kubectl get pods ```) 
* copy the name of the pod and check the logs of the pods and keep refreshing until there is a successful run (``` kubectl logs <name_of_pod> ```)
* check for the output files of the experiment (location in ``` cd /cilantrologs/ ```)

