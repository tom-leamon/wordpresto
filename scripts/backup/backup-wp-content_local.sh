backup_date=$(date +"%Y_%m_%d_%I_%M_%p")

# copy wp-content from container to backup folder on host
docker cp wordpresto-wordpress:var/www/html/wp-content ./backups/wordpresto/temp/wp-content

# tar the wp-content backup folder 
tar -caf ./backups/wordpresto/wp-content/wordpresto-wordpress-wp-content_$backup_date.tar -C ./backups/wordpresto/temp/wp-content .

# copy and tag as latest
cp ./backups/wordpresto/wp-content/wordpresto-wordpress-wp-content_$backup_date.tar ./backups/wordpresto/wp-content/wordpresto-wordpress-wp-content_latest.tar 
