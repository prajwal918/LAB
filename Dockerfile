FROM alpine:latest

# Install necessary development tools (Java, GCC)
RUN apk add --no-cache \
    openjdk17-jdk \
    gcc \
    musl-dev \
    make \
    bash

# Set the working directory
WORKDIR /app

# Copy the project files into the container
COPY src/ /app/src/
COPY tests/ /app/tests/

# Set the default command to start a shell
CMD ["/bin/bash"]