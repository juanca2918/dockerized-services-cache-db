# Dockerfile Base
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /var/www/

# Selecciona la zona horaria
ENV TZ=America/Bogota
ENV COMPOSER_ALLOW_SUPERUSER=1

# Instalamos apache2, php8.0, software properties ppa:ondrej/php, curl, composer, git, nodejs, npm, yarn
RUN apt-get update && apt-get install -y nginx software-properties-common && \
    apt-get update && apt-get install -y sed && \
    apt-get install -y ssl-cert && \
    apt-get update && apt-get install -y nano && \
    add-apt-repository -y ppa:ondrej/php && apt-get update && \
    apt-get install -y php8.2 php8.2-mysql php-bcmath php8.2-curl php8.2-gd php8.2-intl php8.2-mbstring php8.2-soap \
    php8.2-xml php8.2-xmlrpc php8.2-zip php8.2-fpm php8.2-dom libapache2-mod-php8.2 php8.2-redis php8.2-pgsql && apt-get update && apt-get install -y curl && \
    a2enmod php8.2 && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    apt-get update && apt-get install -y git && \
    curl -sL https://deb.nodesource.com/setup_20.x | bash - && apt-get install -y nodejs

RUN apt-get update && apt-get install -y openssh-server && mkdir /var/run/sshd && \
    echo 'root:puertossh' | chpasswd && \
    useradd -m -d /home/devbackend -s /bin/bash devbackend && \
    echo 'devbackend:puertologin' | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    echo "export VISIBLE=now" >> /etc/profile

# Descargamos el proyecto de github
RUN git clone https://juanca2918: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@github.com/DementesWeb/sisconced.git

# Instalamos las dependencias del proyecto
RUN cd sisconced && composer install
RUN cd sisconced && npm install

# Copiamos el archivo .env.example a .env
RUN cd sisconced && cp .env.example .env

# Generamos la key
RUN cd sisconced && php artisan key:generate

RUN cd sisconced && \
    sed -i 's/DB_CONNECTION=mysql/DB_CONNECTION=pgsql/' .env && \
    sed -i 's/DB_PORT=3306/DB_PORT=5432/' .env && \
    sed -i 's/DB_DATABASE=laravel/DB_DATABASE=sisconced/' .env

# En el archivo .env modificamos el cache_driver a redis
RUN sed -i 's/CACHE_DRIVER=file/CACHE_DRIVER=redis/' /var/www/sisconced/.env && \
    sed -i 's/SESSION_DRIVER=file/SESSION_DRIVER=redis/' /var/www/sisconced/.env && \
    sed -i 's/QUEUE_DRIVER=sync/QUEUE_DRIVER=redis/' /var/www/sisconced/.env

WORKDIR /var/www/sisconced/

RUN composer require predis/predis

WORKDIR /etc/nginx/

RUN rm -v /etc/nginx/nginx.conf

COPY ./nginx.conf /etc/nginx/nginx.conf

WORKDIR /var/www/

# setting up la carpeta del proyecto dando permisos al grupo root
RUN find /var/www/sisconced && \
    chown -R root:root /var/www/sisconced && \
    chmod 755 -R /var/www/sisconced/

# Iniciamos el servicio SSH
RUN service ssh start

# Habilitamos el servicio de PHP-FPM
RUN ln -s /etc/php/8.2/fpm/pool.d/www.conf /etc/php/8.2/fpm/pool.d/sisconced.conf

# Habilitamos el nuevo .conf de Nginx
RUN ln -s /etc/nginx/sites-available/sisconced-dev.conf /etc/nginx/sites-enabled/

# Habilitamos los módulos de Nginx
RUN ln -s /etc/nginx/modules-available/rewrite.load /etc/nginx/modules-enabled/
RUN ln -s /etc/nginx/modules-available/headers.load /etc/nginx/modules-enabled/

RUN service nginx start && nginx -t && nginx -s reload

# Exponemos los puertos
EXPOSE 80 22 443

# Iniciamos Nginx
CMD ["nginx", "-g", "daemon off;"]
