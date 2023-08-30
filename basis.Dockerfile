FROM maven:3.6-jdk-8-alpine AS build
ADD http://dl.kezhitech.com/k8s/settings-docker.xml /usr/share/maven/ref/settings-docker.xml
ADD pom.xml /code/pom.xml
RUN mvn dependency:resolve -f /code/pom.xml