FROM openjdk:17
COPY build/libs/hello-0.0.1-SNAPSHOT.jar /hello.jar
CMD ["java", "-jar","/hello.jar"]
