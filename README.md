# Rails Komponent Stimulus Fish

Fish for create rails project with webpack, komponent and stimulus.

# Cloning

    $ git clone git@gitlab.com:igorpavlov-ip/rails_komponent_stimulus_fish.git project_name
    $ cd project_name
    $ bundle
    $ rails webpacker:install
    $ rails generate komponent:install --stimulus
    $ yarn install
    $ rails db:create
    $ rails db:migrate
    $ foreman start -f Procfile.dev

# Set variables:

1 - config/database.yml production section

2 - config/deploy.rb set server, repo, app name, user

3 - config/environment set smtp mailer settings

4 - config/initializers/active_admin.rb set config.site_title

5 - config/provision/configs/application.yml set variables

6 - config/provision/configs/database.yml set password

7 - config/provision/keys/ set keys

8 - config/provision/playbook.yml set app_name
