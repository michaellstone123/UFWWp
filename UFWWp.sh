#!/bin/bash

#################### SET UP UFW
ufw --force disable
ufw --force reset
ufw logging on
ufw default deny incoming
ufw default deny outgoing
ufw allow out proto udp from any to 8.8.8.8 port 53 # dns out
#ufw allow out proto udp from any to any port 67 # dhcp out
#ufw allow in proto udp from any to any port 68 # dhcp in
ufw allow out proto tcp from any to any port 25 # smtp out
#ufw allow in proto tcp from any to any port 25 # smtp in
ufw allow out proto tcp from any to any port 465 # smtp out		
#ufw allow in proto tcp from any to any port 465 # smtp in
ufw allow out proto tcp from any to any port 587 # smtp out
#ufw allow in proto tcp from any to any port 587 # smtp in
ufw allow out proto tcp from any to any port 80 # http out
ufw allow out proto tcp from any to any port 443 # https out
ufw allow in proto tcp from any to any port $SSHPORT # ssh in
ufw allow in proto tcp from any to any port $WEBPORT # web in
ufw allow in proto tcp from any to any port $HTTPSPORT # https in
sudo sed -i '/icmp/ s/ACCEPT/DROP/' /etc/ufw/before.rules # disallow ICMP
ufw --force enable
ufw status numbered # show the new rules with numbers
