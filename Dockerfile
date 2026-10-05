FROM alpine:latest

# Set security labels
LABEL security.hardened="true" \
      security.non-root="true"

# Install necessary development tools (Java, GCC)
RUN apk add --no-cache \
    openjdk17-jdk \
    gcc \
    musl-dev \
    make \
    bash

# Create a non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Set the working directory
WORKDIR /app

# Copy the project files into the container
COPY src/ /app/src/
COPY tests/ /app/tests/

# Change ownership to the non-root user
RUN chown -R appuser:appgroup /app

# Switch to the non-root user
USER appuser

# Set the default command to start a shell
CMD ["/bin/bash"]
