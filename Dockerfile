# Stage 1: Build Stage
FROM maven:3.8.4-openjdk-17-slim AS build

WORKDIR /app
COPY . .

RUN mvn clean package

# Stage 2: Run Stage
FROM openjdk:17-jdk-slim

WORKDIR /app

COPY --from=build /app/target/tv-series-web-app-0.0.1-SNAPSHOT.jar tv-series-web-app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "tv-series-web-app.jar"]
