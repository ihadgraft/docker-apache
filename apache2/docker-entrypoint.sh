#!/bin/sh

# Initalize directory_index
if [ -z "$DIRECTORY_INDEX" ] ; then
    DIRECTORY_INDEX="index.html index.htm"
    if [ ! -z "$PHPFPM_HOST" ] ; then
        DIRECTORY_INDEX="${DIRECTORY_INDEX} index.php"
    fi
fi

if [ ! -z "$PHPFPM_HOST" ] ; then
    mv /etc/optional/php-fpm.conf /etc/apache2/conf.d/php-fpm.conf
fi

if [ ! -d "$DOCUMENT_ROOT" ] ; then
    mkdir -p "$DOCUMENT_ROOT"
fi

if [ ! -d "$SERVER_ROOT" ] ; then
    mkdir -p "$SERVER_ROOT"
fi

ln -s /var/log/apache2 "$SERVER_ROOT"/logs
ln -s /usr/lib/apache2 "$SERVER_ROOT"/modules
ln -s /run/apache2 "$SERVER_ROOT"/run

"$@"
