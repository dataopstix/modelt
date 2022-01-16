#!/usr/bin/env bash

. ./config.cfg

up() {
    echo "Setup data ingestion tool"
    . ./ingestion/setup.sh up
    echo "Setup data ingestion tool completed"

    echo "Setup workflow tool"
    . ./workflow/setup.sh up
    echo "Setup data workflow tool completed"
}

down() {
    echo "Down the data ingestion tool"
    . ./ingestion/setup.sh down
    echo "Down the data ingestion tool completed"

    echo "Down the workflow tool"
    . ./workflow/setup.sh down
    echo "Down the workflow tool completed"

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