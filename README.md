# 9 NFS, FUSE 

**Цель:**
Развернуть сервер с NFS и подключить на клиенте сетевую директорию.

_Задание со звездочкой*
Настроить аутентификацию через KERBEROS (NFSv4)_

**Критерии оценки:**
Статус "Принято" ставится при выполнении основных требований.

- vagrant up должен поднимать 2 виртуалки: сервер и клиент;
- на сервере должна быть настроена директория для отдачи по NFS;
- на клиенте она должна автоматически монтироваться при старте (fstab или autofs);
- в сетевой директории должна быть папка upload с правами на запись;
- требования для NFS: NFS версии 3.
- 
_Доп. задание выполняется по желанию._
