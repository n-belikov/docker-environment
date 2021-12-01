#/bin/bash

currentDate=`date +"%Y-%m-%d"`
docker exec --user=root -it mariadb sh -c "mysqldump -uroot -p $1 > /dumps/self/$1.$currentDate.sql"
filepath="$HOME/Docker/mariadb/dumps/self/$1.$currentDate.sql"
sudo chown nikita:nikita $filepath