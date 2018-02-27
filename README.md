Set variables:

1 - config/database.yml production section

2 - config/deploy.rb set server, repo, app name, user

3 - config/environment set smtp mailer settings

4 - config/initializers/active_admin.rb set config.site_title

5 - config/provision/configs/application.yml set variables

6 - config/provision/configs/database.yml set password

7 - config/provision/keys/ set keys


Up dev environment:

1  - download docker for mac - https://download.docker.com/mac/stable/Docker.dmg

2 - Войти в папку проекта

3 - Запустить демон - docker-compose up

4 - Создать базу данных - docker-compose run webapp rake db:create

5 - Миграции базы данных - docker-compose run webapp rake db:migrate

6 - Наполнить бд данными - docker-compose run webapp rake db:seed


Stop and remove dev environment:

1 - docker-compose down

2 - docker stop $(docker ps -a -q)

3 - docker rm $(docker ps -a -q)

4 - docker rmi $(docker images -a -q)


Check docker images:

1 - листинг процессов - docker ps

2 - docker images
