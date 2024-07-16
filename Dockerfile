#Dockerfile
FROM openjdk:20-jdk
EXPOSE 6789
COPY target/sarah-0.0.1.jar /sarah-0.0.1.jar
ENTRYPOINT ["java", "-jar", "/sarah-0.0.1.jar"]

