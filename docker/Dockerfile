FROM docker.io/postgres:12.3

USER root

COPY docker-entrypoint.sh /sbin/

RUN apt-get update && \
    apt-get install gnupg curl -y && \
    curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
    chmod 755 msfinstall && \
    ./msfinstall && \
    chmod +x /sbin/docker-entrypoint.sh && \
    mkdir -p /root/.msf4 && \
    touch /root/.msf4/database.yml && \
    chmod 777 /root/.msf4/database.yml

ENTRYPOINT [ "/sbin/docker-entrypoint.sh" ]

CMD [ "postgres" ]