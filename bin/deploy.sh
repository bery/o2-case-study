#!/usr/bin/env bash
helm tiller start
helm install --name appa ./charts/app && helm install --name appb ./charts/app
kubectl get pods -o wide # get pods and verify that anti affinity works
