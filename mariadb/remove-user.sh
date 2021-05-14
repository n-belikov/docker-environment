#!/bin/sh
echo "Remove user:"
read USERNAME

sql="DROP USER $USERNAME@"
docker exec --user=root -it mariadb sh -c "mysql -uroot -p -e \"$sql\""
