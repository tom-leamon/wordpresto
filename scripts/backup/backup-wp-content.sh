backup_date=$(date +"%Y_%m_%d_%I_%M_%p")
docker cp wordpresto-wordpress:var/www/html/wp-content /home/admin/wordpresto/backups
