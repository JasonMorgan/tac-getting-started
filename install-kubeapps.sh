#!/bin/bash

## Add the bitnami repo
helm repo add bitnami https://charts.bitnami.com/bitnami

## Install kubeapps for helm3 and configure it to use a load balancer
### You can skip the load balancer if you aren't in the HOL environment
helm install kubeapps bitnami/kubeapps --set useHelm3=true --set frontend.service.type=LoadBalancer --wait


## This is vanilla kubeapps install stuff
kubectl create serviceaccount kubeapps-operator
kubectl create clusterrolebinding kubeapps-operator --clusterrole=cluster-admin --serviceaccount=default:kubeapps-operator

## This emits the key to stdout and you have to copy and paste it into the kubeapps window
kubectl get secret $(kubectl get serviceaccount kubeapps-operator -o jsonpath='{range .secrets[*]}{.name}{"\n"}{end}' | grep kubeapps-operator-token) -o jsonpath='{.data.token}' -o go-template='{{.data.token | base64decode}}' && echo

## You only need this is you didn't use a svc type loadbalancer
k port-forward svc/kubeapps 8080:80

### Tac repo values: tac-repo        https://charts.trials.tac.bitnami.com/demo
