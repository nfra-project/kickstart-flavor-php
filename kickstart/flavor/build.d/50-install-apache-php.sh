#!/bin/bash


set -e

apt-get update
apt-get install -y software-properties-common
add-apt-repository -y ppa:ondrej/php
apt-get update


apt-get -y install gettext apache2 libapache2-mod-php8.0 php8.0-xdebug php8.0-yaml\
                    phpmd phpcpd iputils-ping telnet


## Install Composer2
curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
rm /tmp/composer-setup.php

# npm removed

# Sodium: Rising fatal errors:
# Removed: php-mcrypt => php-libsodium


##cp /root/flavor/000-default.conf /etc/apache2/sites-available/

# Allow access to composer global install scripts
echo 'export PATH="$PATH:/opt/bin:/opt/vendor/bin:/home/user/.config/composer/vendor/bin:$WORKDIR/node_modules/.bin:"' >> /home/user/.bashrc

touch /home/user/.bashrc.kickstart
chmod 755 /home/user/.bashrc.kickstart

echo ". /home/user/.bashrc.kickstart" >> /home/user/.bashrc
