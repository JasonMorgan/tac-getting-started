#!/bin/bash
. demo-magic.sh
clear

## Add the TAC demo repo
p "start by adding the tac repo to helm."
p ""
pe "helm repo add tac-repo https://charts.trials.tac.bitnami.com/demo"
wait
clear

## Checkout the chart values
pe "helm show values tac-repo/mariadb | bat -l yaml"
wait
clear

## Install Maria with some overrides
pe "helm install tac-maria tac-repo/mariadb --set db.user=tac_wordpress --set db.password=password1234 --set db.name=wp_database"
wait
clear

## Checkout the chart values
pe "helm show values tac-repo/wordpress | bat -l yaml"
wait
clear

## Install Wordpress with some overrides
pe "helm install tac-wp tac-repo/wordpress --set mariadb.enabled=false --set externalDatabase.host=tac-maria-mariadb.default.svc.cluster.local --set externalDatabase.user=tac_wordpress --set externalDatabase.password=password1234 --set externalDatabase.database=wp_database"
wait
clear

## Fin, maybe go log into wordpress
