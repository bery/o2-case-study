# o2-case-study
- Create a Kubernetes cluster with at least 2 nodes
- Deploy an application (can be simple hello word) with parts on multiple nodes (see Figure 1). 
- Parts of the application shall communicate with each other. 
- Provide a definition of the cluster and the deployed application (code + description). 

## About
- this repo contains sources for a sample python echo-server app deployed using Helm
- the result is a kubernetes deployment, and a service
- connection to the pods (without an ingress) is achieved via a kubernetes proxy
- k8s cluster is in Azure cloud, 2 nodes with default machines (2 cores, 7 GB ram)
Note: Azure cloud does not allow smaller instance types

## Example 1 - Azure K8s service
- create Azure account
- setup Azure CLI - https://docs.microsoft.com/en-us/azure/aks/kubernetes-walkthrough
- provision the testing cluster ```./bin/10_cluster.sh```, wait for the scrip to finish
- result is the output of ```kubectl get pods``` command and the list of system pods
- install helm
- to install 2 apps run ```./bin/20_deploy.sh```
- wait for the commands to finish
- verify that the two deployments were deployed ```helm list --all```
- run code below to connect to the desired service "appa" or "appb"
```
export APP_LABEL="appa" ./bin/30_test.sh
```
- simple python webservice which returns request parameters and environment variables
- look for HOSTNAME and confirm that it corresponds with output of ```kubectl get pods -o wide```
- or execute ```curl localhost:8080 | grep HOSTNAME``` in a *new terminal window*
- kill the proxy command

## Example 2 - change the image to nginx
- run ```./bin/50_nginx.sh```
- run
```
export APP_LABEL="appa" ./bin/30_test.sh
```
- open ```localhost:8080``` and observe that default nginx welcome page is returned

## Troubleshooting
- in case that something went wrong with helm deployment, run ```helm delete --purge <release_name>``` and start over

## Notes
- for production release a tillerless approach would be much more secure
- ```--wait``` flag is used to make sure that the rolling update or helm install succeeded

## Links
- helm.sh
- https://github.com/rimusz/helm-tiller
- https://ealenn.github.io/Echo-Server/
