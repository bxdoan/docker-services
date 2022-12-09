#!/usr/bin/env bash
s=$BASH_SOURCE ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ; SCRIPT_HOME="$s" # get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path
GC_INSTANCE_ID="dn"
#docker-compose -f "$SCRIPT_HOME/docker-compose.yml" down #TODO we have error when stopping by docker-compose down > Removing network postgres_default; where is this network from?
if [[ $1 == 'gc' ]]; then
    GC="gc_"
else
    GC=""
fi

CONTAINER_NAME="${GC}postgres"; docker stop $CONTAINER_NAME && docker -f rm $CONTAINER_NAME
CONTAINER_NAME="${GC}pgadmin_container"; docker stop $CONTAINER_NAME && docker rm $CONTAINER_NAME
CONTAINER_NAME="${GC}mongodb";             docker stop $CONTAINER_NAME && docker rm -f $CONTAINER_NAME
CONTAINER_NAME="${GC}rabbitmq";          docker stop $CONTAINER_NAME && docker rm -f $CONTAINER_NAME
CONTAINER_NAME="${GC}redis";             docker stop $CONTAINER_NAME && docker rm $CONTAINER_NAME