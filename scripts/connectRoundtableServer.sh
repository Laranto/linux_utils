#!/bin/bash

#Get password
read -s -p "arni@roundtable password: " pwd


#Unmounting if existing ones are there
fusermount -u multimedia
fusermount -u ftp
fusermount -u arni-home

#Mounting...
sudo mkdir /mnt/arni-home
sudo chown arni /mnt/arni-home
curlftpfs arni:$pwd@192.168.178.55/Home-Arni /mnt/arni-home

sudo mkdir /mnt/multimedia
sudo chown arni /mnt/multimedia
curlftpfs arni:$pwd@192.168.178.55/Multimedia /mnt/multimedia

sudo mkdir /mnt/ftp
sudo chown arni /mnt/ftp
curlftpfs arni:$pwd@192.168.178.55/FTP /mnt/ftp
