cd /home/admin/wordpresto/vps/npm && docker-compose up -p "wordpresto-nginx-proxy-manager" -d &&
cd /home/admin/wordpresto/vps/portainer && docker-compose up -p "wordpresto-portainer" -d &&
cd /home/admin/wordpresto && docker-compose up -p "wordpresto-wordpress" -d