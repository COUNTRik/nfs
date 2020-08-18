# #!/bin/bash

# Авторизуемся для получения root прав
mkdir -p ~root/.ssh
cp ~vagrant/.ssh/auth* ~root/.ssh

# Устанавливаем необходимые пакеты
yum install nfs-utils -y

# Создаем папку upload на сервере, которую будем раздавать в сеть
mkdir /upload 

# Даем права на чтение, запись и выполнение папке upload
chmod -R 777 /upload

# Включаем автозагрузку для службы nfs
systemctl enable nfs-server
systemctl enable firewalld
systemctl start nfs-server
systemctl start firewalld

# Запускаем firewall и открываем порты для служб nfs
firewall-cmd --permanent --add-service=nfs
firewall-cmd --permanent --add-service=rpc-bind
firewall-cmd --permanent --add-service=mountd

# Перезапускаем firewall
firewall-cmd --reload

# Добавляем путь к папке, ip и параметры в exports для нашей сетевой папки
echo "/upload 192.168.50.10/24(rw,sync)" > /etc/exports

# Применяем новые настройки для nfs
exportfs -a
