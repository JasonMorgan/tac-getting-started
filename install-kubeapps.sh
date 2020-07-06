#!/bin/bash

helm repo add bitnami https://charts.bitnami.com/bitnami
helm install kubeapps bitnami/kubeapps --set useHelm3=true --set frontend.service.type=LoadBalancer --wait
kubectl create serviceaccount kubeapps-operator
kubectl create clusterrolebinding kubeapps-operator --clusterrole=cluster-admin --serviceaccount=default:kubeapps-operator
kubectl get secret $(kubectl get serviceaccount kubeapps-operator -o jsonpath='{range .secrets[*]}{.name}{"\n"}{end}' | grep kubeapps-operator-token) -o jsonpath='{.data.token}' -o go-template='{{.data.token | base64decode}}' && echo
k port-forward svc/kubeapps 8080:80

### Tac repo values: tac-repo        https://charts.trials.tac.bitnami.com/demo
