FROM ubuntu:20.04
LABEL Description="This is the image for flask EM API"
WORKDIR /tmp

# UTF-8 locale
RUN apt-get clean && \
  apt-get update -y --fix-missing && \
  apt-get install -y locales && \
  locale-gen en_US.UTF-8 && \
  dpkg-reconfigure locales && \
  echo "LC_ALL=en_US.UTF-8\nLANG=en_US.UTF-8\nLANGUAGE=en_US.UTF-8" > /etc/default/locale
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

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