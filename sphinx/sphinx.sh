#!/usr/bin/env bash

while ! nc -zv mariadb-stb 3306
do
    echo "waiting"
    sleep 1
done

indexer --rotate --all -c /opt/sphinx/conf/sphinx.conf

searchd --nodetach --config /opt/sphinx/conf/sphinx.conf
