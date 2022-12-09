#!/usr/bin/env bash
SCRIPT_HOME=$(cd `dirname $BASH_SOURCE` && pwd)  # SCRIPT_HOME ie executed script's containing folder
APP_HOME=$(cd "$SCRIPT_HOME/../.." && pwd)


echo $SCRIPT_HOME;
echo $APP_HOME;

BASE_IMAGE_NAME="python-interpreter-3.9.11"

echo; echo "--> BUILD the base docker image"
docker build --platform linux/x86_64 --file "$SCRIPT_HOME/Dockerfile-native-python"   -t $BASE_IMAGE_NAME           $APP_HOME
#            #build image from this Dockerfile  #t aka tag of the image  #set :pwd folder for Dockerfile

# aftermath check
echo
#docker image ls | grep -iE "$IMAGE_NAME|REPOSITORY"
echo "--> AFTERMATH check. Base Image Name List: "
docker image ls --format '{{.Repository}}:{{.Tag}}' | grep "$BASE_IMAGE_NAME"