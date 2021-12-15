#!/bin/sh

docker build -t php8.1-fpm-alpine --build-arg user=$USER .
