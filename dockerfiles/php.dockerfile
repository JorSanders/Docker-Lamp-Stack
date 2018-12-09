ARG PHPVERSION=0
FROM php:${PHPVERSION}-fpm-alpine

# I think this is needed in the start, for installing some php extensions
RUN docker-php-source extract

RUN apk update

# Install busybox remove the www-data user.
# Replace it with one with the same id as the user
# Chown on /var/www/
RUN apk add --no-cache -u busybox
RUN deluser www-data
RUN set -x \
	&& addgroup -g 1000 -S www-data \
	&& adduser -u 1000 -D -S -G www-data www-data
RUN chown -R www-data /var/www/

# Clean up
RUN docker-php-source delete
RUN rm -rf /var/cache/apk/*

# Xdebug
RUN apk add --no-cache	g++ make
RUN apk add --no-cache	autoconf
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug

# Change the user that executes commands
USER www-data

