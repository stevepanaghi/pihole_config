#!/bin/bash

# Adding to the blacklist from blacklist.txt
while read p; do
  echo pihole -b "$p"
done <Lists/blacklist.txt

# Adding to the regex list from regex.txt
while read p; do
  echo pihole -regex "$p"
done <Lists/regex.txt

# Adding to the whitelist from whitelist.txt
while read p; do
  echo pihole -w "$p"
done <Lists/whitelist.txt

# Adding to Blocklists/Gravity
while read p; do
  echo "$p" | sudo tee -a /etc/pihole/adlists.list > /dev/null
done <Lists/gravitylists.txt
echo
echo "Updating Gravity - this will take a long time"
pihole -g
echo
echo "Pi-Hole lists have been installed and are working"