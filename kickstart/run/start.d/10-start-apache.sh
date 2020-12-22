#!/bin/bash

set -e

/root/.config/composer/vendor/bin/ctool --tpldir /kickstart/_tpl --target /
phpenmod kickstart

if [[ "$DEV_MODE" = "0" ]]
then
    phpdismod xdebug
else
    phpenmod xdebug
    echo 'export PHP_IDE_CONFIG="serverName=$DEV_CONTAINER_NAME"' >> /home/user/.bashrc.kickstart
    echo 'export XDEBUG_CONFIG="idekey=$DEV_CONTAINER_NAME"' >> /home/user/.bashrc.kickstart
fi;

service apache2 start
