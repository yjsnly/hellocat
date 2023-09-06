FROM maven:3.6-jdk-8-alpine AS build
ADD http://dl.kezhitech.com/k8s/settings-docker.xml /usr/share/maven/ref/settings-docker.xml
ADD . /code
RUN mvn clean package -f /code -DskipTests=true

FROM openjdk:8-jre-alpine
ADD http://dl.kezhitech.com/k8s/client.xml /data/appdatas/cat/client.xml
ADD http://dl.kezhitech.com/soft/prometheus/dd-java-agent-1.11.0-SNAPSHOT.jar /ddtrace-agent/dd-java-agent-1.11.0-SNAPSHOT.jar
COPY --from=build /code/target/*.jar /
