FROM maven:3.6-jdk-8-alpine AS build
ADD http://dl.kezhitech.com/k8s/settings-docker.xml /usr/share/maven/ref/settings-docker.xml
ADD . /code
RUN mvn clean package -q -f /code -Dmaven.test.skip=true

FROM openjdk:8u342-jdk-buster
ADD http://dl.kezhitech.com/k8s/client.xml /data/appdatas/cat/client.xml
ADD http://dl.kezhitech.com/soft/prometheus/dd-java-agent-1.11.0-SNAPSHOT.jar /ddtrace-agent/dd-java-agent-1.11.0-SNAPSHOT.jar
COPY --from=build /code/target/*.jar /

#CMD ["java", \
#    "-Xmx1024m", \
#    "-Xms1024m", \
#    "-XX:MetaspaceSize=512M", \
#    "-XX:MaxMetaspaceSize=512M", \
#    "-XX:+UnlockExperimentalVMOptions", \
#    "-XX:+UseCGroupMemoryLimitForHeap", \
#    "-XX:+HeapDumpBeforeFullGC", \
#    "-XX:+HeapDumpAfterFullGC", \
#    "-XX:HeapDumpPath=/dump", \
#    "-XX:-UseAdaptiveSizePolicy", \
#    "-javaagent:/ddtrace-agent/dd-java-agent-1.11.0-SNAPSHOT.jar", \
#    "-Ddd.service.name=cs-question-domain-client-dev", \
#    "-Ddd.env=dev", \
#    "-Ddd.version=v0.0.1", \
#    "-Ddd.agent.port=9529", \
#    "-Ddd.agent.host=192.168.147.141", \
#    "-Ddd.jmxfetch.check-period=1000", \
#    "-Ddd.jmxfetch.statsd.host=192.168.147.141", \
#    "-Ddd.jmxfetch.statsd.port=8125", \
#    "-Ddd.service.mapping=redis:redis_csQD,mysql:mysql_csQD,mongo:mongo_csQD,influxdb:influxdb_csQD", \
#    "-Duser.timezone=Asia/Shanghai", \
#    "-jar", \
#    "/cs-question-domain-client-0.0.1.jar"]
