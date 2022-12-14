# Hyperion

This app is primarily written in Ruby. It is recommended you use [rbenv](https://github.com/rbenv/rbenv)

Hyperion is an event tracking and querying API for keeping track of user behaviour. Hyperion is not for tracking Personally Identifiable Information

Hyperion is built with:
* [Rails](https://rubyonrails.org/) - MVC framework
* [devise](https://github.com/heartcombo/devise) - User authentication
* [PostgreSQL](https://www.postgresql.org/) - Database
* [pgAdmin](https://www.pgadmin.org/) - Database inspector/interface
* [Vite](https://vitejs.dev/) - Frontend build tool
* [Windi CSS](https://windicss.org/) - CSS
* [Inertia JS](https://inertiajs.com/) - Routing

## Getting started

```bash
. install.sh
```

Install the dev kit. This will only install the dev kit for your current shell session. If you would like to install it permanently add `"alias hyp=ruby <install_path>/dev-kit/dev_kit.rb"` to your .bashrc or .zshrc file

```bash
hyp start
```

This will start the docker containers. The application will be available at http://localhost:3000, and a database admin will be available at http://localhost:5050

```bash
hyp rails db:migrate
```
Run all DB migrations

For a full list of available commands in the dev kit, run `hyp help`

### ENV

ENV variables are stored in `/config/application.yml`. Copy the contents of `/config/application.example.yml` and adjust accordingly