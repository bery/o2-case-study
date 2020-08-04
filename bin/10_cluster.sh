#!/usr/bin/env bash
# Create the resource group, provision cluster and configure kubectl credentials.
# List pods
RESOURCE_GROUP="aiAppResourceGroup"
CLUSTER_NAME="aiCluster"
MACHINE_TYPE="Standard_DS2_v2"
az group create --name "${RESOURCE_GROUP}" --location eastus && \
az aks create \
    --resource-group "${RESOURCE_GROUP}" \
    --name "${CLUSTER_NAME}" \
    --node-count 2 \
    --node-vm-size "${MACHINE_TYPE}" \
    --generate-ssh-keys && \
az aks get-credentials --resource-group "${RESOURCE_GROUP}" --name "${CLUSTER_NAME}" && \
kubectl get pods --all-namespaces
