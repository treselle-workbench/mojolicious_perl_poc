FROM ubuntu:16.04

RUN [ "apt-get", "-q", "update" ]
RUN [ "apt-get", "-qy", "--allow-downgrades", "upgrade" ]
RUN [ "apt-get", "-qy", "--allow-downgrades", "dist-upgrade" ]
RUN [ "apt-get", "install", "-qy", "--allow-downgrades", \
      "perl", \
      "build-essential" ]
RUN [ "apt-get", "clean" ]
RUN apt-get install -y curl build-essential m4 libncurses5-dev libssh-dev

RUN curl get.mojolicio.us | sh
RUN curl -L http://cpanmin.us | perl - Mojolicious::Plugin::AccessLog

RUN mkdir -p /opt/perl/
WORKDIR /opt/perl/


COPY [ "./service.pl", "/opt/perl/service.pl" ]
RUN [ "chmod", "+x",  "/opt/perl/service.pl" ]
EXPOSE  3000

CMD [ "morbo", "service.pl" ]