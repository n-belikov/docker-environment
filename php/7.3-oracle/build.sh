#!/bin/sh

docker build -t php7.3-oracle-fpm-alpine --build-arg user=$USER .
