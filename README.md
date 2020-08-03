# o2-case-study
- Create a Kubernetes cluster with at least 2 nodes
- Deploy an application (can be simple hello word) with parts on multiple nodes (see Figure 1). 
- Parts of the application shall communicate with each other. 
- Provide a definition of the cluster and the deployed application (code + description). 

## Local development
- create Azure account
- setup Azure CLI - https://docs.microsoft.com/en-us/azure/aks/kubernetes-walkthrough
- provision the testing cluster ```./bin/cluster.sh```, wait for the scrip to finish
- result is the output of ```kubectl get pods``` command and the list of system pods
- install helm and tiller - ```brew install helm && helm plugin install https://github.com/rimusz/helm-tiller``` 
- ```helm tiller start``` or ```helm tiller start <namespace>``` if you want to run tiller in specific namespace
- to install 2 apps run ```helm install --name appa ./charts/app``` and ```helm install --name appb ./charts/app```
- wait for the commands to finish
- verify that the two deployments were deployed ```helm list --all```
- run code below to connect to the desired service "appa" or "appb"
```
export APP_LABEL="appa" ./tests/bin/init.sh
```
- simple python webservice which returns request parameters and environment variables
- look for HOSTNAME and confirm that it corresponds with output of ```kubectl get pods -o wide```
- or execute ```curl localhost:8080 | grep HOSTNAME``` in a *new terminal window*
- kill the proxy command

## Troubleshooting
- in case that something went wrong with helm deployment, run ```helm delete --purge <release_name>``` and start over
