# untar
tar -xf /home/administrator/backups/wordpresto/wp-content/wordpresto-wordpress-wp-content_latest.tar  -C /home/administrator/backups/temp/wp-content

# restore
docker cp /home/administrator/backups/temp/wp-content/. wordpresto-wordpress:var/www/html/wp-content