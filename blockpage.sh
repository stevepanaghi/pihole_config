#!/bin/bash

cd BlockPage
cp lighttpd.conf /var/www/html
cp pihole-FTL.conf /etc/pihole
cd
sudo service lighttpd restart
echo
echo "Actionable block page is now enabled"