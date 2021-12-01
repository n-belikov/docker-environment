FROM php:7.2-fpm-alpine

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

RUN install-php-extensions calendar exif gd gettext intl \
                           mysqli pcntl pdo_mysql shmop \
                           sockets sysvmsg sysvsem sysvshm \
                           wddx xdebug xsl opcache zip
RUN install-php-extensions pgsql pdo_pgsql soap

COPY php /usr/local/etc

RUN touch /var/log/xdebug.log
RUN chown 1000:1000 /var/log/xdebug.log

RUN apk add fish
RUN apk add composer
RUN apk add git
RUN fish

ARG user

RUN adduser -h /home/user -u 1000 -D $user
USER $user
RUN fish -c "alias a \"php artisan\";funcsave a"
WORKDIR /projects
