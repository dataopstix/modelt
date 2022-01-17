#!/usr/bin/env bash

. ./config.cfg

#Setup files
ingestion_setup="./ingestion/setup.sh"
workflow_setup="./workflow/setup.sh"
transform_setup="./transform/setup.sh"


chmod +x $ingestion_setup
chmod +x $workflow_setup
chmod +x $transform_setup


up() {
    echo "Setup data ingestion tool"
    . $ingestion_setup up
    echo "Setup data ingestion tool completed"

    echo "Setup workflow tool"
    . $workflow_setup up
    echo "Setup data workflow tool completed"

    echo "Setup transform tool"
    . $transform_setup up
    echo "Setup data transform tool completed"
}

down() {
    echo "Down the data ingestion tool"
    . $ingestion_setup down
    echo "Down the data ingestion tool completed"

    echo "Down the workflow tool"
    . $workflow_setup down
    echo "Down the workflow tool completed"

    echo "Down the transform tool"
    . $transform_setup down
    echo "Down the transform tool completed"

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