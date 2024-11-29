#!/bin/bash


set -e

apt-get update
apt-get upgrade -y
apt-get install -y software-properties-common
apt-get update


apt-get -y install gettext apache2 libapache2-mod-php8.3 php8.3-xdebug php8.3-mbstring php8.3-yaml\
                   iputils-ping telnet composer esbuild inotify-tools \
                   php8.3-curl php8.3-http php8.3-raphf php8.3-ssh2 php8.3-sqlite3

# ssh2 is used for composer private repositories
# php8.1-raphf is used for pecl_http


# Install Node and NPM
curl -sL https://deb.nodesource.com/setup_20.x | sudo bash -
sudo apt-get install -y nodejs
sudo npm install -g npm

# npm removed

# Sodium: Rising fatal errors:
# Removed: php-mcrypt => php-libsodium


##cp /root/flavor/000-default.conf /etc/apache2/sites-available/

# Allow access to composer global install scripts
echo 'export PATH="$PATH:$WORKDIR/vendor/bin:/home/user/.config/composer/vendor/bin:$WORKDIR/node_modules/.bin:"' >> /etc/kick_bashrc.d/path

## Default: Enable apache2 Modules: Header, Rewrite
a2enmod headers
a2enmod rewrite

touch /home/user/.bashrc.kickstart
chmod 755 /home/user/.bashrc.kickstart

echo ". /home/user/.bashrc.kickstart" >> /home/user/.bashrc

## Ubuntu 23.04 -> change user ubuntu to uid 999
usermod -u 999 ubuntu
