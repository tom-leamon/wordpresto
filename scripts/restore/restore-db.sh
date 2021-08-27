#/bin/bash
docker exec -i wordpresto-wordpress-db sh -c 'exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD"' < /home/admin/wordpresto/backups/database/wordpresto-wordpress-db_latest.sql