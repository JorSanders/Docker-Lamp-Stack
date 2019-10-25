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

# Images
RUN apk add --no-cache freetype
RUN apk add --no-cache freetype-dev
RUN apk add --no-cache libpng
RUN apk add --no-cache libpng-dev
RUN apk add --no-cache libjpeg-turbo
RUN apk add --no-cache libjpeg-turbo-dev
RUN apk add --no-cache make
RUN docker-php-ext-install iconv
RUN docker-php-ext-enable iconv
RUN docker-php-ext-configure gd \
            --with-freetype-dir=/usr/include/ \
            --with-png-dir=/usr/include/ \
            --with-jpeg-dir=/usr/include/
RUN NPROC=$(getconf _NPROCESSORS_ONLN) \
   &&  docker-php-ext-install -j${NPROC} gd
RUN docker-php-ext-install gd

# Laravel requirements
RUN docker-php-ext-install mbstring
RUN apk add --no-cache libmcrypt-dev

# Soap
RUN apk add libxml2-dev
RUN docker-php-ext-install soap

# Databases
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install pdo

# In container cli
RUN apk add --no-cache mysql-client
RUN apk add --no-cache git

# Clean up
RUN docker-php-source delete
RUN rm -rf /var/cache/apk/*
