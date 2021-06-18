#!/bin/sh

docker build -t php7.4-fpm-alpine --build-arg user=$USER .
