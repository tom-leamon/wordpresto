backup_date=$(date +"%Y_%m_%d_%I_%M_%p")

# copy wp-content from container to backup folder on host
docker cp wordpresto-wordpress:var/www/html/wp-content /home/administrator/backups/wordpresto/temp/wp-content

# tar the wp-content backup folder 
tar -caf /home/administrator/backups/wordpresto/wp-content/wordpresto-wordpress-wp-content_$backup_date.tar -C /home/administrator/backups/wordpresto/temp/wp-content .

# copy and tag as latest
cp /home/administrator/backups/wordpresto/wp-content/wordpresto-wordpress-wp-content_$backup_date.tar /home/administrator/backups/wordpresto/wp-content/wordpresto-wordpress-wp-content_latest.tar 
