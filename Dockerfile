FROM maven:3.9.2 AS builder

COPY . .
RUN mvn clean package

FROM openjdk:17-slim  
COPY --from=builder /target/*.jar app.jar
CMD ["java", "-jar", "/app.jar"]
