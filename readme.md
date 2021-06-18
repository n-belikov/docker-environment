# Docker environment
Для запуска php нужно настроить `php/VERSION/Dockerfile` и `php/VERSION/docker-compose.yml`, а именно:
- docker-compose - volumes
- dockerfile - имя пользователя (nikita)

Далее нужно просто запустить build.sh в папке с версией php

Помимо php нужно еще настроить nginx, а именно поправить volumes в `nginx/docker-compose.yml`

Также необходимо сбилдить mariadb/Dockerfile

## fish

Весь конфиг и алиасы лежат в `fish-console-config`