# TAC Walthrough

Get started using Tanzu Application Catalog (TAC). We're going to walk through how to get started using the TAC helm repo locally, how to install and use kubeapps, and dig into how we could sync harbor with the tac remote repo.

## Things you'll need

* A kubernetes cluster
* A harbor instance
  * We can deploy this into our kube cluster laster if you don't have one ready
* helm 3 installed
* kubectl

## Walkthrough

* Deploying some charts
* Installing kubeapps
* Using kubeapps
* Sync some images to harbor
* Build a new app off of java
* Deploy a postgres instance and connect our app to it
