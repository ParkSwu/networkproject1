FROM openjdk:17-jdk-alpine
WORKDIR /app
COPY build/libs/*.war gradle-wrapper.jar
ENTRYPOINT ["java", "-jar", "gradle-wrapper.jar"]
