name - ваше имя сервиса

1  - download docker for mac - https://download.docker.com/mac/stable/Docker.dmg

2 - Войти в папку проекта

3 - Запустить демон - docker-compose up --build -d name

4 - Создать базу данных - docker-compose run name rake db:create

5 - Создать базу данных - docker-compose run name rake db:migrate

6 - Наполнить бд данными - docker-compose run name rake db:seed

a - остановка демона - docker-compose down
b - листинг процессов - docker ps
