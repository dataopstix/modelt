#!/usr/bin/env bash

#Setup files
transform_setup_tool="./transform/$TRANSFORM/setup.sh"

chmod +x $transform_setup_tool

up() {
    echo "Setup the tool $TRANSFORM"
    . $transform_setup_tool up
    echo "Setup the tool $TRANSFORM completed"
}

down() {
    echo "Down the tool $TRANSFORM"
    . $transform_setup_tool down
    echo "Down the tool $TRANSFORM completed"
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
