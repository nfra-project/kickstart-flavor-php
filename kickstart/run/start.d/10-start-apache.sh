#!/bin/bash

set -e

phpenmod kickstart
phpdismod xdebug


if [[ "$DEV_MODE" = "1" ]]
then
    ## Start SSH for remote debugging
    service ssh start

    # Enable xdebu
    phpenmod xdebug
    echo 'export PHP_IDE_CONFIG="serverName=$DEV_CONTAINER_NAME"' >> /home/user/.bashrc.kickstart
    echo 'export XDEBUG_CONFIG="idekey=$DEV_CONTAINER_NAME"' >> /home/user/.bashrc.kickstart
fi;

apache2ctl -k start
