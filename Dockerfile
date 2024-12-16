# Usa una imagen base de PHP con Apache
FROM php:8.1-apache

# Instala extensiones necesarias para Laravel
RUN apt-get update && apt-get install -y \
    zip \
    unzip \
    libzip-dev \
    libsqlite3-dev \
    curl \
    vim \
    && docker-php-ext-install \
    pdo_mysql \
    mysqli \
    mbstring \
    xml \
    curl \
    pdo_sqlite \
    zip \
    && a2enmod rewrite

# Establece el directorio de trabajo
WORKDIR /var/www/html

# Configura permisos necesarios
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 775 /var/www/html

# Instala Composer
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer
