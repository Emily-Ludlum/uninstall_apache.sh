#!/bin/bash

# Step 1: Uninstall Apache if port 80 is occupied
netstat -anp | grep 80
if [ $? -eq 0 ]; then
    apt-get --purge remove apache2.2 apache2-doc apache2-utils -y
    find /etc -name "*apache*" | xargs rm -rf
    rm -rf /var/www
    rm -rf /etc/libapache2-mod-jk
    touch /var/run/rebooting
    reboot
else
    echo "Apache is not running or port 80 is not occupied. No action needed."
fi
