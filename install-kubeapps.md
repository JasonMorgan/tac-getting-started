# Install Kubeapps

We want to show how to use and install the kubeapps application.

The commands are looked at in more detail [here](install-kubeapps.sh) but you can find the high level overview below.

## CLI Steps

* Add the bitnami repo
* install kubeapps
  * if you're running in the HOL environment you need to ensure the app is set to use a load balancer
* Create a service account
* Copy the token for the kubeapps console

## Web UI steps

* Login with the token
* Browse around the UI
  * Checkout already installed apps
* Remove the default helm repos
* Add the TAC repo
  * URL: https://charts.trials.tac.bitnami.com/demo
* Deploy an app from TAC
  * deploy harbor
