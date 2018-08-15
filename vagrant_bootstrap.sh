#!/usr/bin/env bash

echo "_VGR_SETUP_"

cd /tmp
php -r "copy('https://getcomposer.org/installer', '/tmp/composer-setup.php');"
sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
rm /tmp/composer-setup.php

rm /etc/apache2/sites-available/*.loc.conf 2> /dev/null
cp /vagrant/_conf/*.loc.conf /etc/apache2/sites-available/
a2ensite *
service apache2 restart
