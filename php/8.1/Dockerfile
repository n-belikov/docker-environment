FROM php:8.1-fpm-alpine

ARG user

RUN apk add php8-pdo_mysql php8-pdo php8-exif php8-gettext php8-intl
RUN apk add php8-xsl php8-shmop
RUN apk add php8-sockets php8-sysvmsg php8-sysvsem php8-sysvshm
RUN apk add php8-opcache php8-zip
RUN apk add php8-xdebug php8-redis
RUN apk add php8-gd php8-dom php8-xml php8-xmlwriter php8-fileinfo php8-tokenizer

COPY php /usr/local/etc

RUN touch /var/log/xdebug.log
RUN chown 1000:1000 /var/log/xdebug.log

RUN apk add fish
RUN apk add composer
RUN apk add git
RUN fish
RUN adduser -h /home/user -u 1000 -D $user
USER $user
RUN fish -c "alias a \"php artisan\";funcsave a"
WORKDIR /projects
