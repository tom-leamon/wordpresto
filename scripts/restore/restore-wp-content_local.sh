# untar
tar -xf ./backups/wordpresto/wp-content/wordpresto-wordpress-wp-content_latest.tar  -C ./backups/temp/wp-content

# restore
docker cp ./backups/temp/wp-content/. wordpresto-wordpress:var/www/html/wp-content