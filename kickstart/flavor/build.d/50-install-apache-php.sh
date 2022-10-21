#!/bin/bash


set -e

apt-get update
apt-get upgrade -y
apt-get install -y software-properties-common
apt-get update


apt-get -y install gettext apache2 libapache2-mod-php8.1 php8.1-xdebug php8.1-mbstring php8.1-yaml\
                   iputils-ping telnet esbuild

# Install Node 14x
curl -sL https://deb.nodesource.com/setup_18.x | sudo bash -
sudo apt-get install -y nodejs
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn
# Install NPM
#apt-get -y install --no-install-recommends npm
#npm install --global webpack-cli typescript ts-loader

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
