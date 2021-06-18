#!/bin/sh

docker build -t php5.6-fpm-alpine --build-arg user=$USER .
