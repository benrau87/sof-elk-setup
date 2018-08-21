#!/bin/bash
cp bulk_import.sh /home/elk_user/
chmod +x /home/elk_user/bulk_import.sh
yum install samba samba-client samba-common git
pip install evtxtoelk
mkdir /logstash/hostlogs
chmod 777 /logstash/hostlogs
cp -pf /etc/samba/smb.conf /etc/samba/smb.conf.bak
cat /dev/null > /etc/samba/smb.conf

echo "[global]" > /etc/samba/smb.conf
echo "workgroup = WORKGROUP" >> /etc/samba/smb.conf
echo "server string = SOF-ELK Server %v" >> /etc/samba/smb.conf
echo "netbios name = sof-elk" >> /etc/samba/smb.conf
echo "security = user" >> /etc/samba/smb.conf
echo "map to guest = bad user" >> /etc/samba/smb.conf
echo "dns proxy = no" >> /etc/samba/smb.conf
echo "[Anonymous]" >> /etc/samba/smb.conf
echo "path = /logstash" >> /etc/samba/smb.conf
echo "browsable =yes" >> /etc/samba/smb.conf
echo "writable = yes" >> /etc/samba/smb.conf
echo "guest ok = yes" >> /etc/samba/smb.conf
echo "read only = no" >> /etc/samba/smb.conf

cd /home/elk_user
git clone https://github.com/dgunter/evtxtoelk
cd evtxtoelk
./apply_mapping.sh
chmod +x evtxtoelk.py

