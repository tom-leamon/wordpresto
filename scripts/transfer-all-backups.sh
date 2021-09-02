if [ $# -lt 1 ]; then
    echo "Usage: ./transfer-all-backups.sh [host]"
    exit 1
fi

read -p "Warning: this could overwrite files on the host you are transfering to. Are you sure you wish to continue? yes/no"
if [ "$REPLY" != "yes" ]; then
    exit
fi

rsync -rt /home/administrator/backups/ administrator@$1:/home/administrator