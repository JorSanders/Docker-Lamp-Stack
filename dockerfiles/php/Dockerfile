ARG PHPVERSION=0
FROM php:${PHPVERSION}-fpm-alpine

# I think this is needed in the start, for installing some php extensions
RUN docker-php-source extract

RUN apk update

# Xdebug
RUN apk add --no-cache	g++ make
RUN apk add --no-cache	autoconf
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Joomla!
RUN apk add --no-cache	freetype
RUN apk add --no-cache	freetype-dev
RUN apk add --no-cache	libpng
RUN apk add --no-cache	libpng-dev
RUN apk add --no-cache	libjpeg-turbo
RUN apk add --no-cache	libjpeg-turbo-dev
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install gd

# Laravel requirements
RUN docker-php-ext-install pdo
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install pdo_mysql
RUN apk add --no-cache libmcrypt-dev
RUN apk add --no-cache mysql-client
RUN apk add --no-cache git

# Clean up
RUN docker-php-source delete
RUN rm -rf /var/cache/apk/*