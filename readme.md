# Docker environment
Для запуска именно php нужно настроить `php/VERSION/Dockerfile` и `php/VERSION/docker-compose.yml`, а именно:
- docker-compose - volumnes
- dockerfile - имя пользователя (nikita)

Далее нужно просто запустить build.sh в папке с версией php

Помимо php нужно еще настроить nginx, а именно поправить volumes в `nginx/docker-compose.yml`

Также необходимо сбилдить mariadb/Dockerfile

## fish aliases

``alias a 'docker run --rm -v (pwd):"/app" -w "/app" --user=1000:1000 -it php7.3-fpm-alpine php artisan'``\
``alias dmysql-create 'sh /home/nikita/Docker/mariadb/create.sh'``\
``alias dnode 'docker run --rm -v (pwd):"/app" -w "/app" --user=1000:1000 -it node'``\
``alias dphp73 'docker exec -it php73 fish'``\
``alias a 'docker run --rm -v (pwd):"/app" -w "/app" --user=1000:1000 --network "server-network" -it php7.3-fpm-alpine php artisan'``