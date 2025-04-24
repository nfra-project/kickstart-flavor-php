#!/bin/bash

set -e

phpenmod kickstart

if [[ "$DEV_MODE" = "0" ]]
then
    phpdismod xdebug
else
    # Start sshd
    service ssh start
    # Enable xdebu
    phpenmod xdebug
    echo 'export PHP_IDE_CONFIG="serverName=$DEV_CONTAINER_NAME"' >> /home/user/.bashrc.kickstart
    echo 'export XDEBUG_CONFIG="idekey=$DEV_CONTAINER_NAME"' >> /home/user/.bashrc.kickstart
fi;

apache2ctl -k start
