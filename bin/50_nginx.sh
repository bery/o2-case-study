#!/usr/bin/env bash

echo "performing a rolling update"
helm tiller start-ci default && helm upgrade --wait --set "version=0.5.$RANDOM" --set "image.repository=nginx" appa ./charts/app
kubectl get pods
