#!/bin/sh

echo "Username:"
read USERNAME
echo "Password:"
read PASSWORD
echo "Database:"
read DATABASE

Q2="GRANT ALTER,DELETE,DROP,CREATE,INDEX,INSERT,SELECT,UPDATE,CREATE TEMPORARY TABLES,LOCK TABLES ON $DATABASE.* TO '$USERNAME'@'%' IDENTIFIED BY '$PASSWORD';"
Q3="FLUSH PRIVILEGES;"
sql="${Q2}${Q3}"


docker exec --user=root -it mariadb sh -c "mysql -uroot -p -e \"$sql\""
