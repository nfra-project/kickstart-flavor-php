#!/bin/bash


set -e

apt-get update
apt-get upgrade -y
apt-get install -y software-properties-common
apt-get update


apt-get -y install gettext apache2 libapache2-mod-php\
                   iputils-ping telnet

## Not avilable in 23.04: php8-xdebug php8-mbstring php8-yaml

# Install Node and NPM
curl -sL https://deb.nodesource.com/setup_20.x | sudo bash -
sudo apt-get install -y nodejs


## Install Composer2
curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
rm /tmp/composer-setup.php

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
