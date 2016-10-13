#!/bin/bash
sudo docker run -it --rm --name analysis-db -e POSTGRES_PASSWORD=${1:-mysecretpassword} analysis-database