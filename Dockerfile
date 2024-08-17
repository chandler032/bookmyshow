# Use an official Maven image as a parent image
FROM maven:3.8.6-eclipse-temurin-18 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the pom.xml and download dependencies (this layer will be cached if unchanged)
COPY pom.xml .

# Download dependencies
RUN mvn dependency:go-offline

# Copy the rest of the application source code
COPY src ./src

# Package the application
RUN mvn clean package

# Use a smaller base image for running the application
FROM eclipse-temurin:18-jdk-jammy

# Set the working directory in the container
WORKDIR /app

# Copy the packaged jar from the build stage
COPY --from=build /app/target/*.jar app.jar

# Expose the port your application runs on
EXPOSE 8080

# Set the command to run your app
CMD ["java", "-jar", "app.jar"]
