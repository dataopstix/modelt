#!/usr/bin/env bash


up() {
    echo "Start: Airflow"
    mkdir -p ./workflow/airflow/dags ./workflow/airflow/logs ./workflow/airflow/plugins
    docker-compose -f ./workflow/airflow/docker-compose.yaml up airflow-init
    docker-compose -f ./workflow/airflow/docker-compose.yaml up --detach --no-recreate
    echo "End: Airflow"
}

down() {
    echo "Start: Airflow"
    docker-compose -f ./workflow/airflow/docker-compose.yaml down --volumes
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
