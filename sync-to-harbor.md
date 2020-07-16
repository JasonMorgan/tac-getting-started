# Sync a repo to harbor

In order to show some mechanisms for consuming TAC items we want to replicate some of the TAC demo instance images down to our local harbor instance.

## Setting up Harbor

You can find the steps for replicating GCR to harbor [here](https://docs.bitnami.com/tanzu-application-catalog/how-to/consume-tac-harbor/) but the basic steps are outlined below

* Configure a remote registry
  * The TAC demo repo on GCR
* Configure Replication
* Test replication
* Pull some images

## Images to mirror

We need the following images in order to do the next steps.

* Java
  * gcr.io/sys-2b0109it/demo/bitnami/java:14-centos-7
* git
  * gcr.io/sys-2b0109it/demo/bitnami/git:2-centos-7
* Mysql
  * gcr.io/sys-2b0109it/demo/bitnami/mysql:8.0-centos-7
