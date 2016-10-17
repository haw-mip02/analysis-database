FROM python:latest

MAINTAINER Niklas Voss version: 0.1

RUN pip3 install pymongo flask

ADD ./rest.py /opt/rest.py
CMD ["python3", "/opt/rest.py"]

EXPOSE 5000