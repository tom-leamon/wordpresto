# wordpresto

The fastest way to host Wordpress on a VPS and make it publicly accessible. Includes backup and restore scripts.

[Motivation](#motivation)

[Prerequisites](#prerequisites)

[Quickstart](#quickstart)

[Manual Steps](#manual-steps)

[Local Development](#local-development)

## Motivation

Running `setup.sh` installs Docker and docker-compose, creates all necessary folders, then builds and starts the following applications using Docker:
- Wordpress [port 3070/8081]
- Nginx Proxy Manager [port 80/81/443]
- Portainer [port 9000]

Each application runs in a Docker stack using docker-compose. Each container's data is persisted using docker volume bind mounts. The `/home/administrator/backups` folder contains all backups.

The setup process consists of <b>BOTH</b> an initial automated setup script and a series of manual steps.

## Prerequisites

- Ubuntu 20.04 LTS server with at least 1GB of RAM and 20GB of storage
- `root` user

## Quickstart

1. `sudo useradd -m -p $(openssl passwd -1 [NEW PASSWORD]) administrator`
2. `cd /home/administrator`
3. `git clone https://github.com/tom-leamon/wordpresto.git`
4. `cd wordpresto`
5. `nano .env` to set a unique, secure password for the Wordpress and Nginx Proxy Manager databases. You can also change the Docker container ports.
6. `sudo sh setup.sh` or `sudo sh setup_docker-already-installed.sh` if Docker is already installed on the machine.
7. Follow the manual steps specified below.

## Manual Steps

### Portainer

 1. Visit ``localhost:9000``
 2. Create new account with username ``administrator``

### Nginx Proxy Manager

1. Visit ``localhost:81``

2. Log in as the default admin user

   Username

   ```
   admin@example.com
   ```

   Password
   ```
   changeme
   ```

2. Change the default login email and password

Learn more about [Ngnix Proxy Manger](https://github.com/NginxProxyManager/nginx-proxy-manager).

### Migrating Data Between Hosts

You can transfer the backup data from one environment to another. 

 1. [optional] Run this command on the host you want to copy data from, and specify the host IP address that you want to copy the backups to.

      ``sh /home/administrator/wordpresto/scripts/transfer-all-backups.sh [host ip address]``

 2. Copy database backup .sql file to 
 
     ``/home/administrator/backups/wordpresto/database/wordpresto-wordpress-db_latest.sql``
     
 3. Restore the database by running

      ``sudo sh /home/administrator/wordpresto/scripts/restore/restore-db.sh``

 4. Copy upload backup tar file to
 
       ``/home/administrator/backups/wordpresto/wp-content/wordpresto-wordpress-wp-content_latest.tar``
       
 5. Restore the uploads by running

       ``sudo sh /home/administrator/wordpresto/scripts/restore/restore-wp-content.sh``


## Local Development

You can develop your WordPress website locally before transfering it to the production server. 

For Linux users, you can use the same non-local scripts that are used in production. If you are using Windows or MacOS, use the following scripts.

### Start the Containers

 1. For local development, only WordPress, the WordPress DB, and PHPMyAdmin containers are started.

      `sh scripts/start_local.sh`

### Backup Local WordPress Data and Database

Locally, backups will be saved in to `./backups`

 1. Backup the WordPress database
 
      `sh scripts/backup/backup-db_local.sh`

 2. Backup wp-content
 
      `sh scripts/backup/backup-wp-content_local.sh`


### Restoring a Local Backup

1. Copy the database backup .sql file to 
 
     ``./backups/wordpresto/database/wordpresto-wordpress-db_latest.sql``
     
 3. Restore the database by running

      ``sh ./wordpresto/scripts/restore/restore-db_local.sh``

 5. Copy upload backup tar file to
 
       ``./backups/wordpresto/wp-content/wordpresto-wordpress-wp-content_latest.tar``
       
 6. Restore the uploads by running

       ``sh ./wordpresto/scripts/restore/restore-wp-content_local.sh``


## Troubleshooting 

### SSH Error - WARNING: POSSIBLE DNS SPOOFING DETECTED!

Avoid SSH errors after rebuilding a VM you previously connected to. Use this command to remove entries from known_hosts:

``ssh-keygen -R hostname``

![image](https://user-images.githubusercontent.com/18317587/126028568-c112f7e5-8179-43a6-9a93-0fa1e2ca4c64.png)

### Can't SSH or FTP to host

Make sure the firewall is allowing connections from your IP.
