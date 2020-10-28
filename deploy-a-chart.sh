#!/bin/bash

## Add the TAC demo repo
helm repo add tac-repo https://charts.trials.tac.bitnami.com/demo

## Checkout the chart values
helm show values tac-repo/mariadb | less

## Install Maria with some overrides
helm install tac-maria tac-repo/mariadb --set db.user=tac_wordpress --set db.password=password1234 --set db.name=wp_database

## Checkout the chart values
helm show values tac-repo/wordpress | less

## Install Wordpress with some overrides
helm install tac-wp tac-repo/wordpress --set mariadb.enabled=false --set externalDatabase.host=tac-maria-mariadb.default.svc.cluster.local --set externalDatabase.user=tac_wordpress --set externalDatabase.password=password1234 --set externalDatabase.database=wp_database

## Fin, maybe go log into wordpress
