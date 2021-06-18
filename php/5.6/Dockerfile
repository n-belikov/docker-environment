FROM php:5.6-fpm-alpine

ARG user

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

RUN install-php-extensions bcmath calendar bz2 dba exif redis gd gettext intl pdo_pgsql pgsql \
                           mcrypt mysql mysqli pcntl pdo_mysql shmop soap \
                           sockets sysvmsg sysvsem sysvshm \
                           wddx xdebug opcache zip

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
