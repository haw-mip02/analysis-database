#!/bin/bash
sudo docker run -p 5432:5432 -it --rm --name analysis-db -e POSTGRES_PASSWORD=${1:-mysecretpassword} analysis-database