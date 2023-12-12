FROM harbor.kezhitech.com/library/maven:3.6-jdk-8-alpine as build
ADD http://dl.kezhitech.com/k8s/settings-docker.xml /root/.m2/settings.xml
ADD . /src
RUN mvn clean package -Dmaven.test.skip=true -f /src

FROM harbor.kezhitech.com/library/openjdk:8-jre-alpine
COPY --from=build /src/target/hellocat-*.jar /application.jar

