#!/usr/bin/env bash

docker_compose_file="./workflow/airflow/docker-compose.yaml"

up() {
    echo "Start: Airflow"
    mkdir -p ./workflow/airflow/dags ./workflow/airflow/logs ./workflow/airflow/plugins
    docker-compose -f $docker_compose_file up airflow-init
    docker-compose -f $docker_compose_file up --detach --no-recreate
    echo "End: Airflow"
}

down() {
    echo "Start: Airflow"
    docker-compose -f $docker_compose_file down --volumes --rmi all
    echo "End: Airflow"
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
