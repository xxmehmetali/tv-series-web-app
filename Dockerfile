FROM ubuntu:latest AS build

RUN apt-get update
RUN apt-get install openjdk-17-jdk -y
COPY . .
RUN mvn clean package -DskipTests


FROM openjdk:17-jdk-slim

COPY --from=build /target/tv-series-web-app-0.0.1-SNAPSHOT.jar tv-series-web-app.jar
# ENV PORT=8080
EXPOSE 8080
ENTRYPOINT ["java","-jar","tv-series-web-app.jar"]
