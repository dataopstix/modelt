#!/usr/bin/env bash

up() {
    echo "Start: dbt"
    echo "End: dbt"
}

down() {
    echo "Start: dbt"
    pip3 install dbt-postgres
    mkdir ~/modelt_dbt
    cd ~/modelt_dbt
    mkdir profile
    dbt init $DBT_PROJECT_NAME --profiles-dir ./profile
    echo "dbt installed"
    echo "$PWD"
    cd $PWD
    echo "End: dbt"
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
