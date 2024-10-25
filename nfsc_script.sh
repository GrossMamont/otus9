#!/bin/bash

#Настраиваем клиент NFS
echo "Настраиваем клиент NFS"
echo "Установим утилиты"
sudo apt-get update
sudo apt-get install -y nfs-common mc

echo "Прописываем монтирование"
echo "192.168.56.10:/srv/share/ /mnt nfs vers=3,noauto,x-systemd.automount 0 0" >> /etc/fstab
echo "Рестартуем сервисы"
systemctl daemon-reload 
systemctl restart remote-fs.target 
sleep 10
echo "Посмотрим что подмонтировалось"
mount | grep mnt
echo "Посмортим что лежит в каталоге"
ls /mnt/upload/
echo "Прочитаем файл записанный с сервера"
cat /mnt/upload/from_server
echo "Попробуем записать в него ещё чего-нибудь в /mnt/upload/from_server"
echo "Эта строка записана с клиента в /mnt/upload/from_server" >> /mnt/upload/from_server
echo "Убедимся что всё записано"
cat /mnt/upload/from_server
echo "Попробуем записать в каталог со стороны клиента в /mnt/upload/from_client"
echo "Этот файл был записан с клиента в /mnt/upload/from_client" >> /mnt/upload/from_client
echo "Убедимся что всё записано"
cat /mnt/upload/from_client
