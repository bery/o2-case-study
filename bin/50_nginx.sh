#!/usr/bin/env bash
# Change the image to nginx for appa, rolling update, list pods

echo "performing a rolling update"
helm upgrade --wait --set "version=0.5.$RANDOM" --set "image.repository=nginx" appa ./charts/app
kubectl get pods
