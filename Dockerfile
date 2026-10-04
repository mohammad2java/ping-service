# =========================
# Build stage
# =========================
FROM eclipse-temurin:25-jdk-alpine AS build

WORKDIR /app

# Copy Maven wrapper and project files
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

RUN chmod +x mvnw

# Download dependencies first (better Docker layer caching)
RUN ./mvnw dependency:go-offline

# Copy source
COPY src ./src

# Build application
RUN ./mvnw clean package -DskipTests


# =========================
# Runtime stage
# =========================
FROM eclipse-temurin:25-jre-alpine

WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]