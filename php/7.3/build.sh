#!/bin/sh

docker build -t php7.3-fpm-alpine --build-arg user=$USER .
