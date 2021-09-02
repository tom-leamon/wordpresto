cd /home/administrator/wordpresto/vps/npm && docker-compose up -p "wordpresto-nginx-proxy-manager" -d &&
cd /home/administrator/wordpresto/vps/portainer && docker-compose up -p "wordpresto-portainer" -d &&
cd /home/administrator/wordpresto && docker-compose up -p "wordpresto-wordpress" -d