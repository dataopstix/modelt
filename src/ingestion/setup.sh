#!/usr/bin/env bash

#Setup files
ingestion_setup_tool="./ingestion/$INGESTION/setup.sh"

chmod +x $ingestion_setup_tool

up() {
    echo "Setup the tool $INGESTION"
    . $ingestion_setup_tool up
    echo "Setup the tool $INGESTION completed"
}

down() {
    echo "Down the tool $INGESTION"
    . $ingestion_setup_tool down
    echo "Down the tool $INGESTION completed"
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
