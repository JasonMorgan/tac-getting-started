#!/bin/bash
## Startup script for HOL environment

helm repo add tac-repo https://charts.trials.tac.bitnami.com/demo
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install tac-maria tac-repo/mariadb --set db.user=tac_wordpress --set db.password=password1234 --set db.name=wp_database --wait
helm install tac-wp tac-repo/wordpress --set mariadb.enabled=false --set externalDatabase.host=tac-maria-mariadb.default.svc.cluster.local --set externalDatabase.user=tac_wordpress --set externalDatabase.password=password1234 --set externalDatabase.database=wp_database --wait
kubectl create ns metallb-system
kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.9.2/manifests/metallb.yaml -n metallb-system
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f .lab/metallb-configmap.yaml
helm install kubeapps bitnami/kubeapps --set useHelm3=true --set frontend.service.type=LoadBalancer --wait
helm delete kubeapps
helm delete tac-wp
helm delete tac-maria
kubectl delete pvc -A
helm repo remove tac-repo
helm repo remove bitnami
