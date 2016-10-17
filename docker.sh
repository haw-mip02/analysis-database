#!/bin/bash

if [ "$1" == "build" ]; then
   sudo docker build -t analysis-db ./db
   sudo docker build -t analysis-rest ./rest
elif [ "$1" == "run" ]; then
	mkdir -p `pwd`/db/data
	sudo docker run -d -p 27017:27017 -p 28017:28017 -e MONGODB_USER="analysis" -e MONGODB_PASS="${2:-supertopsecret}" -e MONGODB_DATABASE="analysis" -v ${3:-`pwd`/db/data}:/data/db --name analysis-db-app analysis-db
	sleep 2
	sudo docker run -d -p 5000:5000 --name analysis-rest-app --link analysis-db-app:mongo analysis-rest
elif [ "$1" == "start" ]; then
	sudo docker start analysis-db-app 
	sleep 2
	sudo docker start analysis-rest-app
elif [ "$1" == "stop" ]; then
	sudo docker stop analysis-rest-app analysis-db-app
elif [ "$1" == "logs" ]; then
	if [ "$2" == "db" ]; then
		sudo docker logs analysis-db-app
	else
		sudo docker logs analysis-rest-app
	fi
elif [ "$1" == "rm" ]; then
	sudo docker rm analysis-db-app analysis-rest-app
else 
	echo "No command provided. Possible commands are:"
	echo "    build - Builds the two Docker-Containers."
	echo "    run - Runs the two containers detached. Takes two further arguments the DB-Password and the Data-Directory."
	echo "    TODO..."
fi