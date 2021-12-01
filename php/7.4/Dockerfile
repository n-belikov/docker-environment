FROM php:7.4-fpm-alpine

ARG user

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

RUN install-php-extensions calendar exif gd gettext intl \
                           mysqli pcntl pdo_mysql xsl shmop \
                           sockets sysvmsg sysvsem sysvshm \
                           opcache zip
RUN install-php-extensions ssh2 pgsql pdo_pgsql xdebug yaml redis soap


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
