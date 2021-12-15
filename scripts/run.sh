#!/bin/bash

# Set in host ip
# /sbin/ip route|awk '/default/ { print $3 " hostip" }' >> /etc/hosts

pwd
# cd /var/www/project/project-files/storage && chmod 777 -R . &

# echo "VIRTUAL_HOST : $VIRTUAL_HOST";

# crontab /var/www/project/production/conf/crontab && crond

# cd /var/www/project/project-files

composer dump-autoload --optimize
composer run-script post-install-cmd

php artisan storage:link
# php artisan migrate

# need to do at first time up
# php artisan passport:install --force
php artisan passport:keys --force

# chmod 0600 /var/www/project/project-files/storage/oauth-private.key
# chmod 0600 /var/www/project/project-files/storage/oauth-public.key

php artisan sitemap:update

touch /etc/kinsing /tmp/kdevtmpfsi
chmod 0000 /etc/kinsing
chmod 0000 /tmp/kdevtmpfsi
chattr +i /etc/kinsing
chattr +i /tmp/kdevtmpfsi


# supervisord -n --configuration /var/www/project/production/conf/supervisor-$APP_TYPE.conf
