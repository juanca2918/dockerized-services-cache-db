# bash appsetup.sh

chmod +x appsetup.sh

cd /var/www/sisconced/

composer i

php artisan key:generate

npm i

npm run dev

php artisan server --host=127.0.0.1 --port=80