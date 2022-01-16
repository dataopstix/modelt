#!/usr/bin/env bash


up() {
    echo "Start: Airbyte"
    docker-compose -f ./ingestion/airbyte/docker-compose.yaml up --detach --no-recreate
    echo "End: Airbyte"
}

down() {
    echo "Start: Airbyte"
    docker-compose -f ./ingestion/airbyte/docker-compose.yaml down --volumes
    echo "End: Airbyte"
}

case $1 in up)
    up $0
    ;;
down)
    down
    ;;
*)
    echo "Usage: $0 param"
    echo "------ param -------"
    echo "up - Builds, (re)creates, starts, and attaches to containers for a service."
    echo "down - Stops containers and removes containers, networks, volumes, and images created by up"
    ;;
esac
