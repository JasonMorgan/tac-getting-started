# Deploy some charts from TAC

In order to get a sense of what TAC provides we want to connect to the TAC demo repo and deploy some applications. You can get the exact steps with some comments [here](deploy-a-chart.md).

Outline:

* Set up the TAC repo as a target for helm
* Install mariadb and wordpress
  * First walk through the values yaml for each chart
  * Then override some settings so we can connect wordpress to the maria db
* Checkout the svc and log into wordpress later
