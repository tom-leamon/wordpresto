if [ $# -lt 1 ]; then
    echo "Usage: ./create-user.sh [new administrator password]"
    exit 1
fi

sudo useradd -m -p $(openssl passwd -1 $1) administrator
