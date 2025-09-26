# ter-homework-1

## Чек-лист готовности

Вывод `terraform --version`:

![alt text](https://github.com/RiteHist/ter-homework-1/blob/main/media/1.PNG?raw=true)

## Задание 1

### Ответ на пункт 2:

В файле personal.auto.tfvars

### Ответ на пункт 3:

![alt text](https://github.com/RiteHist/ter-homework-1/blob/main/media/2.PNG?raw=true)

### Ответ на пункт 4:

В строке `resource "docker_container" "1nginx"` имя ресурса должно начинаться либо с буквы, либо с символа `_`.

В строке `resource "docker_image"` отсутствует наименование ресурса, и, как предупреждает сам `terraform validate`, блоки ресурсов должны содержать 2 лейбла: тип и имя.

В строке `name = "example_$(random_password.random_string_FAKE.resulT)` указывается имя ресурса, который не был создан в .tf файле. Дополнительно, `resulT` написан неправильно, должен быть `result`.

### Ответ на пункт 5:

[Исправленный код](https://github.com/RiteHist/ter-homework-1/blob/main/main.tf)

Результат `docker ps`:

![alt text](https://github.com/RiteHist/ter-homework-1/blob/main/media/3.PNG?raw=true)

### Ответ на пункт 6:

`-auto-approve` дает возможность применения конфигурации terraform в рамках скриптов автоматизации в тестовых средах. Но стоит всегда учитывать, что применение конфигурации через `terraform apply` несет с собой риски изменения или удаления важных элементов инфраструктуры в связи с незамеченными ошибками или недочетами в структуре файлов terraform, что в совокупности с флагом `-auto-approve` может привести к плачевным последствиям.

Результат `docker ps`:

![alt text](https://github.com/RiteHist/ter-homework-1/blob/main/media/4.PNG?raw=true)

### Ответ на пункт 7:

[Файл terraform.tfstate](https://github.com/RiteHist/ter-homework-1/blob/main/terraform.tfstate) после `terraform destroy`:


### Ответ на пункт 8:

Это связано с заданным параметром `keep_locally = true` в блоке `resource "docker_image" "nginx"`, который при значении `true` не удаляет образ из локального хранилища при операции `terraform destroy`.

Скриншот из документации провайдера docker, где предоставлена данная информация:

![alt text](https://github.com/RiteHist/ter-homework-1/blob/main/media/5.PNG?raw=true)

## Задание 2

[Ссылка на код по заданию](https://github.com/RiteHist/ter-homework-1/blob/main/assignment-2)

Проверка, что все переменные окружения были переданы в контейнер:

![alt text](https://github.com/RiteHist/ter-homework-1/blob/main/media/6.PNG?raw=true)