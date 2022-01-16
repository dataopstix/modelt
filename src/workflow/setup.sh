#!/usr/bin/env bash


up() {
    echo "Setup the tool $WORKFLOW"
    . ./workflow/$WORKFLOW/setup.sh up
    echo "Setup the tool $WORKFLOW completed"
}

down() {
    echo "Down the tool $WORKFLOW"
    . ./workflow/$WORKFLOW/setup.sh down
    echo "Down the tool $WORKFLOW completed"
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
