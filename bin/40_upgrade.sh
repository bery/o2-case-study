#!/usr/bin/env bash
# Perform a rolling update by changing a dummy version variable

echo "performing a rolling update"
helm upgrade --wait --set "version=0.5.$RANDOM" appa ./charts/app && \
helm upgrade --wait --set "version=0.5.$RANDOM" appb ./charts/app
kubectl get pods
