FROM php:8.2-fpm

# Instala las dependencias
RUN apt-get update && apt-get install -y \
  libpng-dev \
  zlib1g-dev \
  libxml2-dev \
  libzip-dev \
  libonig-dev \
  zip \
  curl \
  unzip

# Instala las extensiones de PHP
RUN docker-php-ext-install mbstring exif pcntl bcmath gd zip mysqli pdo_mysql curl xml tokenizer json intl opcache pgsql pdo_pgsql bcmath soap xmlrpc dom libapache2 redis @composer-2.0.2

# Establece el directorio de trabajo
WORKDIR /var/www

# Copia la aplicación al contenedor
COPY . /var/www

# Otorga permisos al directorio de almacenamiento
RUN chown -R www-data:www-data /var/www/sisconced/storage

# Expone el puerto 9000
EXPOSE 9000