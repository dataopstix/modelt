#!/usr/bin/env bash

docker_compose_file="./ingestion/airbyte/docker-compose.yaml"

up() {
    echo "Start: Airbyte"
    docker-compose -f $docker_compose_file up --detach --no-recreate
    echo "End: Airbyte"
}

down() {
    echo "Start: Airbyte"
    docker-compose -f $docker_compose_file down --volumes --rmi all
    echo "End: Airbyte"
}

case $1 in up)
    up
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
