#!/usr/bin/env bash
# Use ci tiller command and install two versions of the same app for the sake of example - python echo server. List pods
helm tiller start-ci default && \
helm install --name appa ./charts/app && \
helm install --name appb ./charts/app && \
kubectl get pods -o wide # get pods and verify that anti affinity works
