# Use an official Ubuntu runtime as a parent image
FROM ubuntu:20.04

# Set the working directory to /app
WORKDIR /app

# Update the package repository and install OpenJDK and dos2unix
RUN apt-get update && apt-get install -y openjdk-17-jdk dos2unix

# Copy the current directory contents into the container at /app
COPY . .

# Convert line endings to Unix-style (LF)
RUN dos2unix gradlew
RUN chmod +x gradlew

# Build the application
RUN ./gradlew build

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "/app/build/libs/hello-0.0.1-SNAPSHOT.jar"]
