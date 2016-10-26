### Setup Ubuntu 16.04 image ####

FROM ubuntu:16.04
MAINTAINER TRESELLE

###  Installation of perl with related packages ###

RUN [ "apt-get", "-q", "update" ]
RUN [ "apt-get", "-qy", "--allow-downgrades", "upgrade" ]
RUN [ "apt-get", "-qy", "--allow-downgrades", "dist-upgrade" ]
RUN [ "apt-get", "install", "-qy", "--allow-downgrades", \
      "perl", \
      "build-essential" ]
	  
###  Cleanup apt-get cache files  ###

RUN [ "apt-get", "clean" ]
RUN apt-get install -y curl build-essential m4 libncurses5-dev libssh-dev

###  Installation of Mojolicious with related packages and plugins ###

RUN curl get.mojolicio.us | sh
RUN curl -L http://cpanmin.us | perl - Mojolicious::Plugin::AccessLog

### Create a project directory ####

RUN mkdir -p /opt/perl/

### Copy the perl service files and change execution previlages ####

WORKDIR /opt/perl/
COPY [ "./service.pl", "/opt/perl/service.pl" ]
RUN [ "chmod", "+x",  "/opt/perl/service.pl" ]

### EXPOSE perl layer PORT 3000 ####

EXPOSE  3000

### Execute the perl service ####
CMD [ "morbo", "service.pl" ]