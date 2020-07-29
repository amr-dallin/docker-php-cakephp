FROM php:7.4-fpm

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/bin/

COPY --from=composer:2.0.0-alpha2 /usr/bin/composer /usr/bin/composer

RUN install-php-extensions intl gettext gd pdo_mysql zip

RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"