#/bin/bash
backup_date=$(date +"%Y_%m_%d_%I_%M_%p")
docker exec wordpresto-wordpress-db sh -c 'exec mysqldump --all-databases -uroot -p"$MYSQL_PASSWORD"' > "/home/administrator/wordpresto/backups/database/wordpresto-wordpress-db_$backup_date.sql"
cp /home/administrator/wordpresto/backups/database/wordpresto-wordpress-db_$backup_date.sql /home/administrator/wordpresto/backups/database/wordpresto-wordpress-db_latest.sql