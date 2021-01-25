FROM ubuntu:20.04
LABEL Description="This is the image for flask EM API"
WORKDIR /tmp

# Git 2.0
RUN apt-get install -y software-properties-common && \
  add-apt-repository ppa:git-core/ppa && \
  apt-get update -y --fix-missing && \
  apt-get install -y git git-core

# SSH Daemon
RUN apt-get install -y ssh && \
  mkdir /var/run/sshd && \
  chmod 0755 /var/run/sshd

ENTRYPOINT ["/bin/bash", "--login", "-c"]