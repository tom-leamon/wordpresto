cd /home/administrator/wordpresto/apps/nginx && docker-compose up -p "wordpresto-nginx-proxy-manager" -d &&
cd /home/administrator/wordpresto/apps/portainer && docker-compose up -p "wordpresto-portainer" -d &&
cd /home/administrator/wordpresto/apps/wordpress && docker-compose up -p "wordpresto-wordpress" -d