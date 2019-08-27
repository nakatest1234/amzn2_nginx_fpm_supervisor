#!/bin/sh

#/usr/sbin/php-fpm -D && /usr/sbin/nginx -g "daemon off;"
/usr/bin/supervisord -n -c /etc/supervisord.conf
