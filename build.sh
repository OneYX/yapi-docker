#!/bin/bash

#remove exists images
docker stop yapi
docker rm ypai
docker rmi wax/yapi

#rebuild docker image
docker build -t wax/yapi ./
