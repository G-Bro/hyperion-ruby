# Hyperion

Hyperion is an event tracking and querying API for keeping track of what your users have and haven't done, and monitoring user behaviour

## Getting started

`. install.sh`

Install the dev kit. This will only install the dev kit for your current shell session.

`hyp start`

This will initialise the docker containers. The application will be available at `http://localhost:3000`, and a database admin will be available at `http://localhost:5050`

`hyp install`

Installs all dependencies within the docker container

`hyp rails <rails command>`

Runs a rails command inside the docker container