#!/bin/bash

## Configuration vars
export APACHE_CUSTOM_LOG=${APACHE_TRANSFER_LOG:-/dev/null combined}


## Internal vars (to be overwritten by .kick.yml)
export KICK_APACHE_AUTOSTART=${KICK_APACHE_AUTOSTART:-1}
export KICK_APACHE_DOCUMENT_ROOT=${KICK_APACHE_DOCUMENT_ROOT:-/var/www/html}

