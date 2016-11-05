#!/bin/sh

# triply sure there's a newline on the config:
echo "" >> /etc/murmur.ini

[ -f /data/fullchain.pem ] && { echo "sslCert=/data/fullchain.pem" >> /etc/murmur.ini ; }
[ -f /data/privkey.pem ] && { echo "sslKey=/data/privkey.pem" >> /etc/murmur.ini ; }

/opt/murmur/murmur.x86 -supw $MURMUR_PASSWORD
/opt/murmur/murmur.x86 -fg -v -ini /etc/murmur.ini
