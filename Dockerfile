FROM maven:3.8.5-openjdk-11 AS builder
COPY . .
RUN mvn clean package

FROM openjdk:11-jre-slim 
COPY --from=builder /target/*.jar app.jar
CMD ["java", "-jar", "/app.jar"]
