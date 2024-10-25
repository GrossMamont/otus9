#!/bin/bash

#Настраиваем сервер NFS

echo "Настраиваем сервер NFS"
echo "Установим утилиты"
sudo apt-get update
sudo apt-get install -y nfs-kernel-server mc
echo "Посмотрим /etc/nfs.conf"
sudo cat /etc/nfs.conf
echo "Посмотрим ss -tnplu"
sudo ss -tnplu 
echo "создаём и настраиваем директорию"
sudo mkdir -p /srv/share/upload 
sudo chown -R nobody:nogroup /srv/share 
sudo chmod 0777 /srv/share/upload  
echo "Создаём в файле __/etc/exports__ структуру, которая позволит экспортировать ранее созданную директорию"
cat << EOF > /etc/exports 
/srv/share 192.168.56.11/32(rw,sync,no_root_squash,no_subtree_check)
EOF
echo "экспортируем ранее созданную директорию"
exportfs -r
echo "проверяем экспортированную директорию"
exportfs -s
echo "запишем что-нибудь в каталог /srv/share/upload/from_server"
echo "Эта строка записана с сервера в /srv/share/upload/from_server" >> /srv/share/upload/from_server
echo "Убедимся что всё записано"
sudo cat /srv/share/upload/from_server
