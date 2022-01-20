#!/bin/sh

docker build -t php8.0-fpm-alpine --build-arg user=$USER .
