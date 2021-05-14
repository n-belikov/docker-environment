FROM php:7.3-fpm-alpine
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/
RUN install-php-extensions redis
COPY . /app
COPY docker/app/php.ini /usr/local/etc/php/php.ini
COPY docker/app/www.conf /usr/local/etc/php-fpm.d/www.conf
WORKDIR /app
RUN chown -R www-data:www-data storage \
    && chown -R www-data:www-data bootstrap/cache \
    && chmod -R 775 storage \
    && chmod -R 775 bootstrap/cache
USER 82:82
