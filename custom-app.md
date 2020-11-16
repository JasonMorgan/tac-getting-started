# Deploy our Custom App

Now that we have our instance built out we can update our kubernetes manifest to use it.

## Kubernetes Deployment Template

You can find a [sample template](kube-templates/petclinic-deployment.yaml) under kube-templates. 

The template assumes you've already created a mysql database in the default namespace. If you haven't please either comment out the env variables section or deploy a mysql database. 

```bash
helm install spring-db tac-repo/mysql --set db.user=petclinic --set db.password=petclinic --set db.name=petclinic
```
