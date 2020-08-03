#!/usr/bin/env bash
APP_LABEL=${APP_LABEL:-"appa"}
APP_LABELB=${APP_LABEL:-"appa"}
kubectl get pods --namespace default \
  -l "app.kubernetes.io/name=${APP_LABEL},app.kubernetes.io/instance=${APP_LABEL}" -o jsonpath="{.items[0].metadata.name}" && \
kubectl get pods --namespace default \
  -l "app.kubernetes.io/name=${APP_LABELB},app.kubernetes.io/instance=${APP_LABELB}" -o jsonpath="{.items[0].metadata.name}" && \
export POD_NAME=$(kubectl get pods --namespace default \
  -l "app.kubernetes.io/name=${APP_LABEL},app.kubernetes.io/instance=${APP_LABEL}" -o jsonpath="{.items[0].metadata.name}") && \
echo "Visit http://127.0.0.1:8080 to use your application" && \
kubectl port-forward $POD_NAME 8080:80
