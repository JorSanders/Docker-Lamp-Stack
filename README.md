# Docker Xamp/Lamp stack. With Apache and Nginx

Docker running Nginx, PHP-FPM, MySQL. 

This is for DEVELOPMENT purposes!

## Overview

0. [Install prerequisites](#install-prerequisites)

    Install docker and docker-compose

0. [Setup your own repo](#setup-your-own-repo)

    Download the code from this repository.

0. [Run the application](#set-the-env-variables)

    Start up the webservice.
            
0. [Useful docker commands](#useful-docker-commands)

    Helpful list of docker commands I find useful.


## Install prerequisites

* [Docker](https://docs.docker.com/engine/installation/)
* [Docker Compose](https://docs.docker.com/compose/install/)

## Setup 

- Clone this repo ```git@github.com:JorSanders/Docker-php.git```

- Edit the .env file
 
	- Set the Project Name
	- Set the Ip
	- Set the versions
- (optional) Add entries to your /etc/hosts file
	- ```sudo nano /etc/hosts```
  

## Useful Docker commands

- Start docker compose on the foreground

```docker-compose up```

- Start docker compose on the background

```docker-compose up -d```

- Execute a shell command in the container

```docker-compose up {service} ls```

- Open an interactive shell in a container

```docker-compose up {service} /bin/sh```

- Stop and remove the containers and network of the docker compose stack

```docker-compose down```

- Recreate the containers

```docker-compose up --force-recreate```

- Recreate the containers and rebuild the docker images

```docker-compose up --force-recreate --build```

- List the active docker containers

```docker container ps```

- List all docker containers

```docker container ps -a```

- Remove all stopped containers 

```docker container prune```

- Stop all containers

```docker container stop $(docker container ps aq)```

- List all docker images

```docker container image ls```

- List all docker networks

```docker container network ls```

- Or just like any other person

```docker-compose --help```

```docker --help```
