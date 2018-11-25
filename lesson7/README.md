#  Шаблон виртуальной машины для приложения Reddit App
Шаблон создан в рамках обучения


## Как использовать 

Для использования шаблона необходим packer и gcloud
https://cloud.google.com/sdk/docs/quickstart-debian-ubuntu
https://www.packer.io/intro/getting-started/install.html

После установки указанных программ, необходимо запустить packer для создания образа.
```
packer build -var 'project_id=infra-223321' -var 'source_image=ubuntu-1604-xenial-v20181030' -var 'lan_tag=puma-server' immutable.json
```
Поддерживаются следующие переменные:
project_id - имя проекта google
source_image - исходный образ
lan_tag - имя тега сети

