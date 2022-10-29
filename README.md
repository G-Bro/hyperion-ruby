# Hyperion

## Prerequisites

This app is primarily written in Ruby. It is recommended you use [rbenv](https://github.com/rbenv/rbenv)

Hyperion is an event tracking and querying API for keeping track of what your users have and haven't done, and monitoring user behaviour

Hyperion is built with:
* [Rails](https://rubyonrails.org/) - MVC framework
* [devise](https://github.com/heartcombo/devise) - User authentication
* [PostgreSQL](https://www.postgresql.org/) - Database
* [pgAdmin](https://www.pgadmin.org/) - Database inspector/interface

## Dev kit

`. install.sh`

Install the dev kit. This will only install the dev kit for your current shell session. If you would like to define it permanently add `"alias hyp=ruby <install_path>/dev-kit/dev_kit.rb"` to your .bashrc or .zshrc file

`hyp start <service>`

This will initialise the docker containers, or a specific container if one is provided. The application will be available at `http://localhost:3000`, and a database admin will be available at `http://localhost:5050`

`hyp stop <service>`

This will stop all docker containers, or a specific container if one is provided.

`hyp install <package-name> <version>`

Installs all dependencies within the docker container. If a package name is provided it will be added to the Gemfile. Additionally, a version can be specified.

`hyp rails <rails command>`

Runs a rails command inside the docker container

`hyp help`

Lists all other available commands