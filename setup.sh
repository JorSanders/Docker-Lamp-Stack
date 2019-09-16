#!/bin/bash

# This is a general-purpose function to ask Yes/No questions
ask() {
  # https://gist.github.com/davejamesmiller/1965569
  local prompt default reply

  if [ "${2:-}" = "Y" ]; then
    prompt="Y/n"
    default=Y
  elif [ "${2:-}" = "N" ]; then
    prompt="y/N"
    default=N
  else
    prompt="y/n"
    default=
  fi

  while true; do

    # Ask the question (not using "read -p" as it uses stderr not stdout)
    echo -n "$1 [$prompt] "

    # Read the answer (use /dev/tty in case stdin is redirected from somewhere else)
    read reply </dev/tty

    # Default?
    if [ -z "$reply" ]; then
      reply=$default
    fi

    # Check if the reply is valid
    case "$reply" in
    Y* | y*) return 0 ;;
    N* | n*) return 1 ;;
    esac

  done
}

# TODO make sure script is running in correct directory

# Check that we have root access. Needed to update the hosts file
if [ "$(id -u)" -ne 0 ]; then
  echo 'you need to run this with sudo'
  exit 1
fi

# TODO: check if $SUDO_USER is empty. Maybe the user is actually root?
userid=$(id -u $SUDO_USER)

tld="com"
# The project is the name of the parent directory
projectName=$(basename $(dirname "$PWD"))
# Confirm the domain name before writing to the hosts file
while true; do
  if ask "Your url will look like local.${projectName}.${tld} is this correct?"; then
    break
  else
    # Project name
    if ask "Do you want to change your domain name? (currently: ${projectName})"; then
      read -r -p "New Domainname: " projectName
    fi

    # Tld
    if ask "Do you want to change your tld? (currently: ${tld})"; then
      read -r -p "New tld: " tld
    fi
  fi
done

# iterate through the ipaddresses untill one is found that does not exist in the hosts file
# TODO: handle when 255 is reached
# TODO: check if hostname already exists
for i in $(seq 100 255); do
  ipaddress="192.168.$i"
  if ! grep -q $ipaddress "/etc/hosts"; then
    break
  fi
done

# Add the lines to the hosts file
# TODO: add lines in a specified section instead on the bottom
echo "${ipaddress}.5   local.${projectName}.${tld}" >>"/etc/hosts"
echo "${ipaddress}.7   local.msqyl.${projectName}.${tld}" >>"/etc/hosts"
echo "${ipaddress}.8   local.nginx.${projectName}.${tld}" >>"/etc/hosts"

# Edit some files
replace_in_file() {
  sed -i "s/${2}/${3}/g" "${1}"
}

replace_in_file 'docker-compose.yml' 'nameless-static-network' "${projectName}-static-network"
replace_in_file '.env' 'PROJECTNAME=hello_world' "PROJECTNAME=${projectName}"
replace_in_file '.env' 'IPV4ADDRESS=192.168.100' "IPV4ADDRESS=${ipaddress}"
replace_in_file '.env' 'USERID=1000' "USERID=${userid}"

file=../public_html/index.php
if test -f "$file"; then
  docker-compose up -d
else
  echo 'Cannot find ../public_html/index.php.'
  echo 'If you are running a non standard setup please configure the .env file before running docker-compose up'
fi

echo 'Setup finished!'

rm setup.sh
