FROM jenkins:2.19.1

USER root

RUN apt-get -qq update && \
    apt-get -qqy install apt-transport-https ca-certificates && \
    apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D && \
    (echo 'deb https://apt.dockerproject.org/repo debian-jessie main' > /etc/apt/sources.list.d/docker.list) && \
    apt-get -qq update && \
    apt-get -qqy install ruby ruby-bundler docker-engine
RUN gpasswd -a jenkins staff && gpasswd -a jenkins docker

USER jenkins
