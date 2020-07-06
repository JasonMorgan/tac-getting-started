# Kubeapps Getting Started

A list of things to look at and do when installing kubeapps.

* Configure the kubeapps repo
  * `helm repo add bitnami https://charts.bitnami.com/bitnami`
* Install mariadb
  * `helm install bit-maria bitnami/mariadb --set db.user=bit_wordpress --set db.password=password1234 --set db.name=wp_database`
* Install Wordpress
  * `helm install bit-wp bitnami/wordpress --set mariadb.enabled=false --set externalDatabase.host=bit-maria-mariadb.default.svc.cluster.local --set externalDatabase.user=bit_wordpress --set externalDatabase.password=password1234 --set externalDatabase.database=wp_database`
* Install kubeapps

```bash

helm install kubeapps bitnami/kubeapps --set useHelm3=true
kubectl create serviceaccount kubeapps-operator
kubectl create clusterrolebinding kubeapps-operator --clusterrole=cluster-admin --serviceaccount=default:kubeapps-operator
kubectl get secret $(kubectl get serviceaccount kubeapps-operator -o jsonpath='{range .secrets[*]}{.name}{"\n"}{end}' | grep kubeapps-operator-token) -o jsonpath='{.data.token}' -o go-template='{{.data.token | base64decode}}' && echo
k port-forward svc/kubeapps 8080:80

```

* Add a custom helm repo
* Delete a helm repo
* Look at and create a namespace
* Looks at Operators
  * install operator?
* Show docs site
  * https://docs.bitnami.com/general/apps/
  * [Production ready charts](https://docs.bitnami.com/tutorials/production-ready-charts/)
  * Look at a [chart](https://docs.bitnami.com/general/infrastructure/kafka/get-started/understand-default-config/)
* Dig into custom values
