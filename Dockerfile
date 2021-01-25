FROM ubuntu:20.04
LABEL Description="This is the image for flask EM API"
WORKDIR /tmp

# Git 2.0
RUN apt-get install -y software-properties-common 
RUN apt-get install -y add-apt-repository ppa:git-core/ppa 
RUN apt-get install -y apt-get update -y --fix-missing
RUN apt-get install -y apt-get install -y git git-core

# SSH Daemon
RUN apt-get install -y ssh
RUN apt-get install -y mkdir /var/run/sshd
RUN apt-get install -y chmod 0755 /var/run/sshd

ENTRYPOINT ["/bin/bash", "--login", "-c"]