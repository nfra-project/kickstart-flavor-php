#!/bin/bash


set -e

apt-get update
apt-get -y install --no-recommends apache2 libapache2-mod-php7.4 composer php7.4-curl php-xdebug php-mbstring php-yaml php-xml php-json php-http


# npm removed

# Sodium: Rising fatal errors:
# Removed: php-mcrypt => php-libsodium


##cp /root/flavor/000-default.conf /etc/apache2/sites-available/

# Allow access to composer global install scripts
echo 'export PATH="$PATH:/opt/vendor/bin:/home/user/.composer/vendor/bin:$WORKDIR/node_modules/.bin:"' >> /home/user/.bashrc

touch /home/user/.bashrc.kickstart
chmod 755 /home/user/.bashrc.kickstart

echo ". /home/user/.bashrc.kickstart" >> /home/user/.bashrc


composer global require nfra/ctool


