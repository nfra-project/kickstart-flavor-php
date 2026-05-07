#!/bin/bash


set -e

apt-get update
apt-get upgrade -y
apt-get install -y software-properties-common
apt-get update


apt-get -y install gettext apache2 libapache2-mod-php php-xdebug php-mbstring php-yaml\
                   iputils-ping telnet composer esbuild inotify-tools \
                  php-bcmath php-bz2 php-curl php-exif php-ftp php-gd php-gmp php-http php-igbinary php-imagick  php-intl php-ldap php-memcached php-mongodb php-msgpack php-mysql php-odbc php-pspell php-raphf php-readline php-redis php-snmp php-soap php-sockets php-sqlite3 php-ssh2 php-tidy php-xml php-xmlrpc php-xsl php-zip
# ssh2 is used for composer private repositories
# php8.1-raphf is used for pecl_http


# Install Node and NPM
curl -sL https://deb.nodesource.com/setup_22.x | sudo bash -
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
