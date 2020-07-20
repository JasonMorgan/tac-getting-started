# Create and Deploy an Application on top of a TAC Image

Now that we've installed some apps with helm, used kubeapps, and replicated images into harbor it's time to build our first custom application. In this case we plan on using [Spring Petclinic](https://github.com/spring-projects/spring-petclinic).

## Dockerfile

We've included a sample dockerfile that does a multi stage build in order to pull petclinic, compile it, and prep our container.

Assuming you're using your own harbor instance urls will all need to be changed to ensure you're connecting to the appropriate container registry. Steps are listed in more details [here](create-an-app.sh).
