FROM mdillon/postgis:9.6

MAINTAINER Niklas Voss version: 0.1

RUN apt-get update
RUN apt-get install -y software-properties-common python3 python3-pip postgresql-server-dev-9.6
RUN pip3 install psycopg2

ADD ./rest.py /opt/rest.py

CMD ["python", "/opt/rest.py"]