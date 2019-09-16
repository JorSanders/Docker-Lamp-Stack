# Docker Xamp/Lamp stack. With Apache and Nginx

Docker running Apache, PHP-FPM, MySQL and Nginx. 

This is for DEVELOPMENT purposes!

Only for Linux machines. On mac docker-compose does not support static networks. 
Also the setup.sh is based on linux setups (tested on Fedora and Ubuntu).

For extra info see [the wiki](https://github.com/JorSanders/Docker-Lamp-Stack/wiki).

For questions feel free to contact me.

### Prerequisites
* [Docker](https://docs.docker.com/engine/installation/)
* [Docker Compose](https://docs.docker.com/compose/install/)

### How to use
Assuming you have a project similar to [this](https://github.com/JorSanders/phptest). 
Where there is a root directory which the webserver should have no access too.
And a subdirectory the webserver should have access too (public_html).
0. Clone this repo in the root directory (The webserver shouldn't have access to the dockerfiles and stuff).   
`git clone git@github.com:JorSanders/Docker-Lamp-Stack.git`
0. Enter the new directory.   
`cd Docker-Lamp-Stack`
0. Run the setup script.  
`sudo sh setup.sh`
0. Check the .env file, update where desired.
0. Run `docker-compose up`.

##### Without the setup.sh
Good job not just running any script of github, especially one that asks you to run with sudo. 
0. Update the .env file. You need to set the ip address and the project name.
0. Update the docker-compose file. Find and replace on 'nameless-static-network' to something unique.
0. Update your /etc/hosts file. Add lines with the ip addresses of your containers and the domain name you want to use to access them.
