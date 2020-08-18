# #!/bin/bash

# Авторизуемся для получения root прав
mkdir -p ~root/.ssh
cp ~vagrant/.ssh/auth* ~root/.ssh

# Устанавливаем необходимые пакеты
yum install nfs-utils -y

# Создаем папку upload на сервере, которую будем раздавать в сеть
mkdir /mnt/upload 

# Монтируем сетевую парку в папку nfs
mount -t nfs -o vers=3 192.168.50.10:/upload /mnt/upload

#echo "192.168.50.10:/upload /mnt/upload nfs rw,vers=3 0 0" > /etc/fstab