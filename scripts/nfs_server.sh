# #!/bin/bash

# Авторизуемся для получения root прав
mkdir -p ~root/.ssh
cp ~vagrant/.ssh/auth* ~root/.ssh

# Устанавливаем необходимые пакеты
yum install nfs-utils -y

# Создаем папку upload на сервере, которую будем раздавать в сеть
mkdir /upload 
