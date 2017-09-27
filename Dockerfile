# pull base image
FROM sot001/ansible-slave:latest

USER root
RUN wget -qO- https://deb.nodesource.com/setup_6.x | bash - && \
    DEBIAN_FRONTEND=noninteractive  \
    apt-get update -y            && \
    DEBIAN_FRONTEND=noninteractive  \
    apt-get install nodejs -y && \
    DEBIAN_FRONTEND=noninteractive  \
    npm install -g nave

USER jenkins

ENV PATH        /opt/ansible/bin:$PATH
ENV PYTHONPATH  /opt/ansible/lib:$PYTHONPATH
ENV MANPATH     /opt/ansible/docs/man:$MANPATH
ENV SHELL       /bin/bash


# default command: display Ansible version
#ENTRYPOINT [ "ansible-playbook", "--version" ]
ENTRYPOINT ["jenkins-slave"]
