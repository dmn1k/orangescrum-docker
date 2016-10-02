#!/bin/bash

# Add the environment variables to the config file
while IFS='=' read -r name value ; do
    if [[ $name == 'OSCRUM_'* ]]; then
        tname="${name/OSCRUM_/}"
        sed -i "s/define([\"']${tname}[\"'].*);/define(\"$tname\", \"${!name//\//\\\/}\");/" /var/www/html/app/Config/constants.php
    fi
done < <(env)

# Start the apache server
/usr/sbin/apache2ctl -D FOREGROUND
