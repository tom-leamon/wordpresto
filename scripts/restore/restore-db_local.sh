#/bin/bash
docker exec -i wordpresto-wordpress-db sh -c 'exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD"' < ./backups/wordpresto/database/wordpresto-wordpress-db_latest.sql