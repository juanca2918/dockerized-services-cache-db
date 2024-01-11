FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
  curl \
  git \
  libzip-dev \
  libonig-dev \
  libpng-dev \
  libxml2-dev \
  unzip \
  libssl-dev \
  libexif-dev \
  libxml2-dev \
  libfreetype6-dev \
  libjpeg62-turbo-dev \
  libicu-dev \
  libpq-dev \
  zlib1g-dev \
  g++ \
  libcurl4-openssl-dev

RUN docker-php-ext-configure gd --with-freetype --with-jpeg

RUN docker-php-ext-install gd
RUN docker-php-ext-install zip
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install pcntl
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install curl
RUN docker-php-ext-install xml
RUN docker-php-ext-install intl
RUN docker-php-ext-install opcache
RUN docker-php-ext-install pdo_pgsql
RUN docker-php-ext-install dom

RUN pecl install redis \
  && docker-php-ext-enable redis

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -sL https://deb.nodesource.com/setup_20.x | bash - && apt-get install -y nodejs

COPY ./app/sisconced /var/www/sisconced

COPY ./app/appsetup.sh /var/www/sisconced/appsetup.sh

WORKDIR /var/www/

EXPOSE 80

CMD ["php-fpm"]