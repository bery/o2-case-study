#!/usr/bin/env bash
set -x

APP_LABEL=${APP_LABEL:-"appa"}
export POD_NAME=$(kubectl get pods --namespace default \
  -l "app.kubernetes.io/name=app,app.kubernetes.io/instance=${APP_LABEL}" -o jsonpath="{.items[0].metadata.name}") && \
echo "Visit http://127.0.0.1:8080 to use your application" && \
kubectl port-forward $POD_NAME 8080:80
