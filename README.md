# Run php applications with a Nginx webserver and a MySQL database

Docker running Nginx, PHP-FPM, MySQL. 

INTENDED FOR DEVELOPMENT.

Any feedback or questions are welcome.

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

## Setup your own repo

Cd into the directory you want to host your project. IE ```~/Projects/xxxx```.

Git clone the project.

```
$ git clone https://github.com/jorsanders/docker-php.git
```

Alternatively you can add this repo as a remote besides your own git repo.

```git remote add docker-php https://github.com/jorsanders/docker-php.git```

```git checkout -b docker-php docker-php/master```

Then switch into your branch and merge the new branch into yours.

```git checkout development```

```git merge docker-php --allow-unrelated-histories```

## Set the env variables

If you want pre-configurations for Joomla! or Laravel switch to their respective branch.

You open up the .env file in the project root. You will see some environment variables just change these to your desired values.
These are the default values as how I set them up. 

Please change the IP address to something unused. I recommend setting it to a [private network IP](https://en.wikipedia.org/wiki/IPv4#Private_networks). 
Careful not to set it to the IP address of your router :)

Also set the Project name. 

Be sure to add the ip address in your host file.

```
sudo nano /etc/hosts
```

Then add a line like this. Change the first 3 parts of the ip address to how you set yours in the .env file
```
x.x.x.5	docker.dev www.docker.dev
```


## Run the application


2. Start the application

```
$ docker-compose up
```
    
3. Open your browser

[192.168.100.5](http://192.168.100.5)
   

## Useful Docker commands
For docker compose commands you'll first need to be in root the directory of this repo. 

If you are using phpstorm I recommend opening a terminal in there. With Alt+F12.

Starts all the containers defined in the project in the foreground.
```
docker-compose up
```

Useful flags
```
-d   detached mode(doesn't stay open in your terminal)
--force-recreate (recreates all containers)
--build (rebuilds all images)
```

Removes all containers and networks listed in the compose.yml
```
docker-compose down
```

Lists all active containers
```
docker ps
```
Add the ```-a``` flag to include stopped containers

Execute terminal commands in a container
```
docker-compose exec <service name> <shell command>
```

Inspect a container
```
docker inspect <container id>
```

Stops a container
```
docker stop <container id>
```

Stops all containers
```
docker stop $(docker ps -q)
```

Stops remove all stopped containers
```
docker container prune
```

Lists all docker images
```
docker images
```

Removes an image
```
docker image rm <image id>
```

Removes all images
```
docker image rm $(docker image ls -q)
```

List all networks
```
docker network ls
```

Remove a network
```
docker network rm <network id>
```

Remove all networks
```
docker network rm $(docker network ls -q)
```
