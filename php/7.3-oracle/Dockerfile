FROM php:7.3-fpm

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

RUN install-php-extensions calendar exif gd gettext intl \
                           mysqli pcntl pdo_mysql shmop bcmath \
                           sockets sysvmsg sysvsem sysvshm \
                           wddx xdebug xsl opcache zip
#RUN install-php-extensions pgsql pdo_pgsql soap

COPY php /usr/local/etc

RUN touch /var/log/xdebug.log
RUN chown 1000:1000 /var/log/xdebug.log

RUN apt-get update && apt-get install -qqy git unzip libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libaio1 wget && apt-get clean autoclean && apt-get autoremove --yes &&  rm -rf /var/lib/{apt,dpkg,cache,log}/ 
#composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


# Sphinx
RUN mkdir /opt/sphinx
COPY sphinx/sphinx-rel22.zip /opt/sphinx/sphinx-rel22.zip
COPY sphinx/php-sphinx-lib.zip /opt/sphinx/php-sphinx-lib.zip

RUN cd /opt/sphinx && unzip sphinx-rel22.zip && rm -rf sphinx-rel22.zip
RUN cd /opt/sphinx/sphinx-rel22/api/libsphinxclient \
    && ./configure \
    && make \
    && make install

RUN cd /opt/sphinx && unzip php-sphinx-lib.zip && rm -rf php-sphinx-lib.zip

RUN cd /opt/sphinx/php-sphinx-lib \
	&& phpize \
	&& ./configure \
	&& make \
	&& make install \
	&& docker-php-ext-enable sphinx.so


# ORACLE oci 
RUN mkdir /opt/oracle \
    && cd /opt/oracle     
    
ADD instantclient-basic-linux.x64-12.1.0.2.0.zip /opt/oracle
ADD instantclient-sdk-linux.x64-12.1.0.2.0.zip /opt/oracle

# Install Oracle Instantclient
RUN  unzip /opt/oracle/instantclient-basic-linux.x64-12.1.0.2.0.zip -d /opt/oracle \
    && unzip /opt/oracle/instantclient-sdk-linux.x64-12.1.0.2.0.zip -d /opt/oracle \
    && ln -s /opt/oracle/instantclient_12_1/libclntsh.so.12.1 /opt/oracle/instantclient_12_1/libclntsh.so \
    && ln -s /opt/oracle/instantclient_12_1/libclntshcore.so.12.1 /opt/oracle/instantclient_12_1/libclntshcore.so \
    && ln -s /opt/oracle/instantclient_12_1/libocci.so.12.1 /opt/oracle/instantclient_12_1/libocci.so \
    && rm -rf /opt/oracle/*.zip
    
ENV LD_LIBRARY_PATH  /opt/oracle/instantclient_12_1:${LD_LIBRARY_PATH}
# Install Oracle extensions
RUN echo 'instantclient,/opt/oracle/instantclient_12_1/' | pecl install oci8-2.2.0 \
      && docker-php-ext-enable \
               oci8 \ 
       && docker-php-ext-configure pdo_oci --with-pdo-oci=instantclient,/opt/oracle/instantclient_12_1,12.1 \
       && docker-php-ext-install \
               pdo_oci
RUN install-php-extensions ldap soap ev

RUN apt update
RUN apt-get install -qqy fish
#RUN apt-get install -qqy composer
#RUN apt-get install -qqy git
RUN fish

RUN apt-get install -y locales locales-all
RUN locale-gen "en_US.UTF-8"
RUN dpkg-reconfigure locales

ARG user
RUN adduser --disabled-password --uid 1000 nikita
USER $user
#RUN fish -c "alias a \"php artisan\";funcsave a"
WORKDIR /projects
