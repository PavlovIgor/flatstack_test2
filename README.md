# Rails Komponent Stimulus Fish

Fish for create rails project with webpack, komponent and stimulus.

# Cloning

    $ git clone git@gitlab.com:igorpavlov-ip/rails_komponent_stimulus_fish.git project_name
    $ cd project_name
    $ bundle
    $ yarn install

config/database.yml

    $ rails db:create
    $ rails db:migrate
    $ foreman start -f Procfile.dev

config/application.yml

# Mail

config/environment set smtp mailer settings

# Devise

    $ rails generate devise Model
    $ rails db:migrate
    $ rails generate devise:views

Restart server

# Capistrano

config/deploy.rb set server, repo, app name, user

# Ansible

config/provision/configs/application.yml set variables

config/provision/configs/database.yml set password

config/provision/keys/ set keys

config/provision/playbook.yml set user, app_name
