#!/bin/bash

## Change the image urls in your dockerfile to match the locally deployed harbor

docker login my-registry-url

docker build -t my-registry-url/tac/petclinic .

docker push my-registry-url/tac/petclinic
