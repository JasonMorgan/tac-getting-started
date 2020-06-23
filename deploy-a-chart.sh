#!/bin/bash

helm repo add tac-repo https://charts.trials.tac.bitnami.com/demo

helm show values tac-repo/mariadb | less

helm install tac-maria tac-repo/mariadb --set db.user=tac_wordpress --set db.password=password1234 --set db.name=wp_database

helm show values tac-repo/wordpress | less

helm install tac-wp tac-repo/wordpress --set mariadb.enabled=false --set externalDatabase.host=tac-maria-mariadb.default.svc.cluster.local --set externalDatabase.user=tac_wordpress --set externalDatabase.password=password1234 --set externalDatabase.database=wp_database

k port-forward svc/tac-wp-wordpress 8080:80
