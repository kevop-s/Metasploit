#!/bin/bash
###############################################
#                                             #
#          Metasploit Framework Runit         #
#                                             #
###############################################

MF_CONTAINER="metasploit"
POSTGRES_PASSWORD="yourpassword"

mkdir -p /var/containers/$MF_CONTAINER/var/lib/postgresql/data
chown 999:999 -R /var/containers/$MF_CONTAINER

docker run -itd --name $MF_CONTAINER \
    -v /usr/share/zoneinfo:/usr/share/zoneinfo:ro \
    -v /etc/localtime:/etc/localtime:ro \
    -v /var/containers/$MF_CONTAINER/var/lib/postgresql/data:/var/lib/postgresql/data:z \
    -e "POSTGRES_PASSWORD=$POSTGRES_PASSWORD" \
    -e "TZ=America/Mexico_City" \
    kevopsoficial/metasploit