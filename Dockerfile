FROM mdillon/postgis

MAINTAINER Niklas Voss version: 0.1

ADD ./database-setup.sh /tmp/database-setup.sh
RUN /bin/sh /tmp/database-setup.sh