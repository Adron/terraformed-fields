Systemd

List services:

systemctl list-unit-files
Start service:

systemctl start {SERVICENAME}
Stop service:

systemctl stop {SERVICENAME}
Enable service:

systemctl enable {SERVICENAME}
Disable service:

systemctl disable {SERVICENAME}


https://www.axllent.org/docs/view/nodejs-service-with-systemd/

https://www.terlici.com/2015/06/20/running-node-forever.html

## Top Two Options Above, ideally something that works more simply than iptables.

sudo iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 3000

http://serverfault.com/questions/238563/can-i-use-ufw-to-setup-a-port-forward

http://serverfault.com/questions/752581/ufw-forwarding-on-port-80-to-port-3000-on-single-vps

Might work for starting Node.js
http://kvz.io/blog/2009/12/15/run-nodejs-as-a-service-on-ubuntu-karmic/
