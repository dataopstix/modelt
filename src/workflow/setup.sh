#!/usr/bin/env bash

workflow_setup_tool="./workflow/$WORKFLOW/setup.sh"

up() {
    echo "Setup the tool $WORKFLOW"
    . $workflow_setup_tool up
    echo "Setup the tool $WORKFLOW completed"
}

down() {
    echo "Down the tool $WORKFLOW"
    . $workflow_setup_tool down
    echo "Down the tool $WORKFLOW completed"
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
