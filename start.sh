#!/bin/bash

# Add the environment variables to the config file
while IFS='=' read -r name value ; do
    if [[ $name == 'OSCRUM_'* ]]; then
        tname="${name/OSCRUM_/}"
        sed -i "s/define([\"']${tname}[\"'].*);/define(\"$tname\", \"${!name//\//\\\/}\");/" /var/www/orangescrum/app/Config/constants.php
    fi
done < <(env)

service httpd start
service mysqld start
