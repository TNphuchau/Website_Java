#Dockerfile
FROM openjdk:20-jdk
EXPOSE 6789
COPY target/sarah.jar /sarah.jar
ENTRYPOINT ["java", "-jar", "/sarah.jar"]

