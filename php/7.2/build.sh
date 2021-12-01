#!/bin/sh

docker build -t php7.2-fpm-alpine --build-arg user=$USER .
