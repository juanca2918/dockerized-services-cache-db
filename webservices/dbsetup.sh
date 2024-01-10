# bash dbsetup.sh

chmod +x dbsetup.sh

service postgresql start

su - postgres -c "createdb -E UTF8 -T template0 --locale=en_US.utf8 -O sisconced" 

CREATE USER desarrollador WITH PASSWORD 'mysecretpassword';

GRANT ALL PRIVILEGES ON DATABASE sisconced TO desarrollador;