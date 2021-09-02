

# wordpresto

The fastest way to host Wordpress on a VPS and make it publicly accessible. Includes backup and restore scripts.

[Motivation](#motivation)

[Prerequisites](#prerequisites)

[Quickstart](#quickstart)

[Manual Steps](#manual-steps)


## Motivation

Running `scripts/start.sh` installs Docker and docker-compose, creates all necessary folders, then builds and starts the following applications using Docker:
- Wordpress
- Nginx Proxy Manager
- Portainer

Each application runs in its own Docker stack using docker-compose. Each container's data is persisted using docker volume bind mounts. The `/home/administrator/backups` folder contains all backups.

The setup process consists of <b>BOTH</b> an initial automated setup script and a series of manual steps.

## Prerequisites

- Ubuntu VPS with at least 2GB of RAM and 20GB of storage
- User named `administrator` with sudo privileges
-  `/home/administrator` directory

## Quickstart

1. `cd /home/administrator` 
2. `git clone https://github.com/tom-leamon/wordpresto.git`
3. `cd wordpresto`
4. `nano .env` and set unique, secure passwords.
5. `sudo sh setup.sh`
6. Follow the manual steps specified below.

## Manual Steps

### Migrating backups between hosts

You can transfer the backup data from one environment to another. Run this command on the host you want to copy data from, and specify the host IP address that you want to copy the backups to.

``sh /home/administrator/wordpresto/scripts/transfer-all-backups.sh [host ip address]``

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

### Wordpress

 1. Copy database backup .sql file to 
 
     ``/home/administrator/backups/wordpresto/database/wordpresto-wordpress-db_latest.sql``
     
 3. Restore the database by running

      ``sudo sh /home/administrator/wordpresto/apps/wordpress/restore/restore-db.sh``

 5. Copy upload backup tar file to
 
       ``/home/administrator/backups/wordpresto/wp-content/wordpresto-wordpress-wp-content_latest.tar``
       
 6. Restore the uploads by running

       ``sudo sh /home/administrator/wordpresto/apps/wordpress/restore/restore-wp-content.sh``


# Troubleshooting 

### SSH Error - WARNING: POSSIBLE DNS SPOOFING DETECTED!

Avoid SSH errors after rebuilding a VM you previously connected to. Use this command to remove entries from known_hosts:

``ssh-keygen -R hostname``

![image](https://user-images.githubusercontent.com/18317587/126028568-c112f7e5-8179-43a6-9a93-0fa1e2ca4c64.png)

### Can't SSH or FTP to host

Make sure the firewall is allowing connections from your IP.
