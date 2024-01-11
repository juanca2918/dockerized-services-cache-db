# bash appsetup.sh

#!/bin/bash

# Iniciar el servicio
php-fpm &

# Esperar a que se cree el archivo de socket
while [ ! -e /var/run/php/php8.2-fpm.sock ]; do sleep 1; done

# Cambiar el propietario del archivo de socket
chown www-data:www-data /var/run/php/php8.2-fpm.sock

ls -l /var/run/php/php8.2-fpm.sock

# Mantener el contenedor en ejecución
tail -f /dev/null

chmod +x appsetup.sh

composer i

php artisan key:generate

npm i

npm run dev

php artisan migrate

php artisan serve --host=127.0.0.1 --port=80