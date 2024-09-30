FROM maven:3.8.1-openjdk-21 AS build
WORKDIR /app
COPY . .
RUN mvn clean install

FROM openjdk:21-slim
WORKDIR /app
EXPOSE 5000
COPY --from=build /app/target/livechatms-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
