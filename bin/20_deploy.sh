#!/usr/bin/env bash
# Install two versions of the same app for the sake of example - python echo server. List pods
helm install --wait appa ./charts/app && \
helm install --wait appb ./charts/app && \
kubectl get pods -o wide # get pods and verify that anti affinity works
