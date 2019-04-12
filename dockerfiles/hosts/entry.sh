#!/usr/bin/env bash

add_hosts_line(){
	#$1 ip
	#$2 ip
	#$3 subdomain
	#$4 project name
	#$5 domain tld

	line="$1.$2	$3.$4.$5"
	file="/etc/hosts"
	grep -qxF "${line}" $file || echo "${line}" >> $file
	echo "Added the following line to your /etc/hosts file:"
	echo $line
}

add_hosts_line ${IPV4ADDRESS} 5 local ${PROJECTNAME} ${TLD}
add_hosts_line ${IPV4ADDRESS} 7 local.mysql ${PROJECTNAME} ${TLD}
add_hosts_line ${IPV4ADDRESS} 8 local.nginx ${PROJECTNAME} ${TLD}