#!/bin/bash

helm repo add bitnami https://charts.bitnami.com/bitnami
helm install kubeapps bitnami/kubeapps --set useHelm3=true
kubectl create serviceaccount kubeapps-operator
kubectl create clusterrolebinding kubeapps-operator --clusterrole=cluster-admin --serviceaccount=default:kubeapps-operator
k port-forward svc/kubeapps 8080:80

### Tac repo values: tac-repo        https://charts.trials.tac.bitnami.com/demo
## Create new namespace
## Deploy harbor
### Name internal-registry
## Port forward