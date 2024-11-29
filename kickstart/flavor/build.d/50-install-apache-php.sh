#!/bin/bash


set -e

apt-get update
apt-get upgrade -y
apt-get install -y software-properties-common
apt-get update


apt-get -y install gettext apache2 libapache2-mod-php8.3 php8.3-xdebug php8.3-mbstring php8.3-yaml\
                   iputils-ping telnet composer esbuild inotify-tools \
                   php8.3-curl php8.3-http php8.3-raphf php8.3-ssh2 php8.3-sqlite3 php8.3-mysql php8.3-xml php8.3-zip php8.3-intl php8.3-gd php8.3-imagick php8.3-redis php8.3-memcached php8.3-mongodb php8.3-ldap php8.3-bcmath php8.3-igbinary php8.3-msgpack php8.3-sockets php8.3-xmlrpc php8.3-soap php8.3-ldap php8.3-xml php8.3-bz2 php8.3-exif php8.3-ftp php8.3-gettext php8.3-gmp php8.3-imap php8.3-odbc php8.3-pspell php8.3-readline php8.3-snmp php8.3-tidy php8.3-xmlrpc php8.3-xsl php8.3-zip php8.3-imagick php8.3-redis php8.3-memcached php8.3-mongodb php8.3-ldap php8.3-bcmath php8.3-igbinary php8.3-msgpack php8.3-sockets php8.3-xmlrpc php8.3-soap php8.3-ldap php8.3-xml php8.3-bz2 php8.3-exif php8.3-ftp php8.3-gettext php8.3-gmp php8.3-imap php8.3-odbc php8.3-pspell php8.3-readline php8.3-snmp php8.3-tidy php8.3-xmlrpc php8.3-xsl php8.3-zip php8.3-imagick php8.3-redis php8.3-memcached php8.3-mongodb php8.3-ldap php8.3-bcmath php8.3-igbinary php8.3-msgpack php8.3-sockets php8.3-xmlrpc php8.3-soap php8.3-ldap php8.3-xml php8.3-bz2 php8.3-exif php8.3-ftp php8.3-gettext php8.3-gmp php8.3-imap

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
