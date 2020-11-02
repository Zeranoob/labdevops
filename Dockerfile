#docker build -t DevOpsUsach2020-0.0.1 -f Dockerfile .
FROM openjdk:8-jre
# Microservicio port
EXPOSE 8080

ADD build/DevOpsUsach2020-0.0.1.jar /app/DevOpsUsach2020-0.0.1.jar
# Fix zona horaria de Chile
RUN apt-get update && apt-get install -y tzdata
ENV TZ America/Santiago

WORKDIR /app
CMD java -Djava.security.egd=file:/dev/./urandom ${JAVA_OPTS} -jar DevOpsUsach2020-0.0.1.jar
