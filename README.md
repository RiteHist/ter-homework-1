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

В строке `resource "docker_image"` отсутствует наименование ресурса, и, как предупржает сам `terraform validate` блоки ресурсов должны содержать 2 лейбла: тип и имя.

В строке `name = "example_$(random_password.random_string_FAKE.resulT)` указывается имя ресурса, который не был создан в .tf файле. Дополнительно, `resulT` написан неправильно, должен быть `result`.

### Ответ на пункт 5:

Исправленный код:

https://github.com/RiteHist/ter-homework-1/blob/main/main.tf

Результат `docker ps`:

![alt text](https://github.com/RiteHist/ter-homework-1/blob/main/media/3.PNG?raw=true)

### Ответ на пункт 6:

`-auto-approve` дает возможность использования применения конфигурации terraform в рамках скриптов автоматизации в тестовых средах. Но стоит всегда учитывать, что применение конфигурации через `terraform apply` несет с собой риски изменения или удаления важных элементов инфраструктуры в связи с незамеченными ошибками или недочетами в структуре файлов terraform, что в совокупности с флагом `-auto-approve` может привести к плачевным последствиям.

Результат `docker ps`:

![alt text](https://github.com/RiteHist/ter-homework-1/blob/main/media/4.PNG?raw=true)