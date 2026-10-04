# syntax=docker/dockerfile:1

# ---- Build stage -------------------------------------------------------------
# The JAR is built by Maven inside the container, so the image never depends on a
# host JDK. Maven from the base image is used instead of ./mvnw.
FROM maven:3.9-eclipse-temurin-25 AS build
WORKDIR /workspace

# Resolve dependencies against the POM alone so this layer is cached until the POM
# changes. go-offline is best-effort; the package step below still resolves anything
# this misses, so a partial warm-up cannot fail the build.
COPY pom.xml .
RUN --mount=type=cache,target=/root/.m2 mvn -B -ntp dependency:go-offline || true

COPY src ./src
# Tests already ran in the pipeline's build job; skipping here keeps image builds fast.
RUN --mount=type=cache,target=/root/.m2 mvn -B -ntp clean package -DskipTests

# Explode the fat JAR into layer-optimised directories, keeping the launcher
# classes alongside them. Boot 4.x registers this mode as "tools" (renamed from
# the Boot 2/3 "layertools"), and --launcher is required to also emit
# spring-boot-loader/ -- without it that directory is extracted empty.
RUN java -Djarmode=tools -jar /workspace/target/*.jar extract \
        --layers --launcher --destination /app/extract

# ---- Runtime stage -----------------------------------------------------------
FROM eclipse-temurin:25-jre AS runtime

# curl backs the HEALTHCHECK below; the slim JRE image ships without it.
RUN apt-get update \
    && apt-get install -y --no-install-recommends curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Run unprivileged: the base image ships a `nonroot` user (uid 10001).
COPY --from=build --chown=nonroot:nonroot /app/extract/dependencies/ ./
COPY --from=build --chown=nonroot:nonroot /app/extract/spring-boot-loader/ ./
COPY --from=build --chown=nonroot:nonroot /app/extract/application/ ./

USER nonroot
EXPOSE 8080
ENV JAVA_TOOL_OPTIONS="-XX:MaxRAMPercentage=75.0"

HEALTHCHECK --interval=30s --timeout=5s --start-period=45s --retries=3 \
    CMD curl -fsS http://localhost:8080/actuator/health || exit 1

# Exec form so the JVM is PID 1 and receives SIGTERM for graceful shutdown.
ENTRYPOINT ["java", "org.springframework.boot.loader.launch.JarLauncher"]