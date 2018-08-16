#!/usr/bin/env bash

echo "_ENV_SETUP_"
curl https://www.dotdeb.org/dotdeb.gpg | sudo apt-key add -
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

#echo 'deb http://packages.dotdeb.org jessie all' >> /etc/apt/sources.list
#echo 'deb-src http://packages.dotdeb.org jessie all' >> /etc/apt/sources.list

apt-get update && apt-get upgrade -y
apt-get install -y build-essential nodejs
apt-get install -y curl make vim mc git openssl apache2 mysql-server php7.0
apt-get install -y php7.0-zip php7.0-mbstring php7.0-readline php7.0-cli php7.0-common php7.0-gd php7.0-json php7.0-mcrypt php7.0-mysql php7.0-readline

a2enmod rewrite 2> /dev/null
npm install gulp -g

echo "_VGR_SETUP_"

# Install composer
cd /tmp
php -r "copy('https://getcomposer.org/installer', '/tmp/composer-setup.php');"
sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
rm /tmp/composer-setup.php

# Cp a2 configuration
rm /etc/apache2/sites-available/*.loc.conf 2> /dev/null
cp /vagrant/_conf/*.loc.conf /etc/apache2/sites-available/
a2ensite *
service apache2 restart
