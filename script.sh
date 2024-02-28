#!/bin/bash

docker network create --driver bridge external_network
docker network create --driver bridge internal_network

git clone --branch ny https://github.com/ParkSwu/networkproject1.git

cd networkproject1

chmod +x gradlew

./gradlew build -x test

docker build -t my-spring-app .

docker run --name db-mysql -p 3306:3306 --network internal_network -e MYSQL_ROOT_PASSWORD=password -e MYSQL_DATABASE=mydb -e MYSQL_USER=user -e MYSQL_PASSWORD=password -d mysql:5.7

docker run -p 9090:9090 --name springboot-mysql --network internal_network -d my-spring-app

./gradlew bootRun
