# Rails Komponent Stimulus Fish

Fish for create rails project with webpack, komponent and stimulus.

# Cloning

    $ git clone git@gitlab.com:igorpavlov-ip/rails_komponent_stimulus_fish.git project_name
    $ cd project_name
    $ bundle
    $ yarn install
    $ rails db:create

config/database.yml

    $ rails db:migrate
    $ foreman start -f Procfile.dev

# Set variables:

config/deploy.rb set server, repo, app name, user

config/environment set smtp mailer settings

config/provision/configs/application.yml set variables

config/provision/configs/database.yml set password

config/provision/keys/ set keys

config/provision/playbook.yml set user, app_name
