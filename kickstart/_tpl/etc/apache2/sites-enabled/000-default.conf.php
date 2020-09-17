## This config was generated by cloudtool from /kickstart/_tpl/etc/*

<?php

$kickApacheVhostConfig = getenv("KICK_APACHE_VHOST_CONFIG");


?>
<Directory <?= getenv("KICK_APACHE_DOCUMENT_ROOT") ?>>
    AllowOverride All
    DirectoryIndex index.php index.html
    Require all granted
</Directory>

<VirtualHost *>
    ServerAdmin webmaster@localhost
    DocumentRoot <?= getenv("KICK_APACHE_DOCUMENT_ROOT") ?>

    CustomLog <?= getenv("APACHE_CUSTOM_LOG"); ?>

    ## Custom configuration from .kick.yml "apache_vhost_config":

    <?php
    if( ! empty($kickApacheVhostConfig))
        echo $kickApacheVhostConfig;
    ?>

</VirtualHost>



