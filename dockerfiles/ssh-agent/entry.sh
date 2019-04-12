#!/usr/bin/env bash

# Create proxy-socket for ssh-agent (to give everyone acceess to the ssh-agent socket)
echo "Creating a proxy socket..."
rm ${SSH_AUTH_SOCK} ${SSH_AUTH_PROXY_SOCK} > /dev/null 2>&1
socat UNIX-LISTEN:${SSH_AUTH_PROXY_SOCK},perm=0666,fork UNIX-CONNECT:${SSH_AUTH_SOCK} &

echo "Launching ssh-agent..."

/usr/bin/ssh-agent -a ${SSH_AUTH_SOCK}

ssh-add /.ssh/jor

tail -F /dev/null
