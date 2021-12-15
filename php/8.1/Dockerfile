FROM php:8.1-fpm-alpine

ARG user

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/
# TODO отказаться от install-php-extensions. Начинает сильно сбоить пиздец.
RUN install-php-extensions calendar exif gettext intl
RUN install-php-extensions mysqli pcntl
RUN install-php-extensions pdo_mysql xsl shmop
RUN install-php-extensions sockets sysvmsg sysvsem sysvshm
RUN install-php-extensions opcache zip
RUN install-php-extensions ssh2 pgsql pdo_pgsql
RUN install-php-extensions xdebug yaml redis soap

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
