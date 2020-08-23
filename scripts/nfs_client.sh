# #!/bin/bash

# Авторизуемся для получения root прав
mkdir -p ~root/.ssh
cp ~vagrant/.ssh/auth* ~root/.ssh

# Устанавливаем необходимые пакеты
yum install nfs-utils -y

# Создаем папку upload на сервере, которую будем раздавать в сеть
mkdir /mnt/upload 

# Добавляем строку в fstab для монтирования папки при автозагрузке
echo "192.168.50.10:/upload /mnt/upload nfs rw,vers=3,noauto,x-systemd.automount   0 0" >> /etc/fstab

# Даем права на чтение, запись и выполнение папке upload
chmod -R 777 /mnt/upload