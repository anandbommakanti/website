#!/bin/sh
RUNNING_CONTAINER_ID=`sudo docker ps | grep website | awk -F' ' '{print $1}'`
RUNNING_CONTAINER_NAME=`sudo docker ps | grep website | awk -F' ' '{print $2}'`

if [[ "$RUNNING_CONTAINER_NAME" == "website" ]]
then
    echo 'Found an instance of docker container. Stoppig now...'
    sudo docker stop $RUNNING_CONTAINER_ID
else
    echo 'No instance of website docker container found.'
fi