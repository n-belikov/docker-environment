#!/bin/sh


# docker exec --user=root -it mariadb sh -c 'mysql -uroot -p -e "show databases;"'

echo "Database name:"
read DATABASE
sql1="CREATE DATABASE IF NOT EXISTS $DATABASE DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;;"

docker exec --user=root -it mariadb sh -c "mysql -uroot -p -e \"$sql1\""
