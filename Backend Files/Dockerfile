#Build image
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /endabank-backend
COPY . .
RUN mvn clean package
RUN mvn install

#Package stage
FROM openjdk:17.0.1-jdk-slim
WORKDIR /endabank-backend
EXPOSE 8080
COPY --from=build /endabank-backend/target/endabank-0.0.1-SNAPSHOT.jar /usr/local/lib/backend.jar
ENTRYPOINT ["java","-jar","/usr/local/lib/backend.jar"]


