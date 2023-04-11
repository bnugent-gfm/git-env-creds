# Use Debian as the base image
FROM debian:latest

# Install git
RUN apt-get update && \
    apt-get install -y git

# Copy custom Git credential helper script
COPY git-credential-env /usr/local/bin/git-credential-env
RUN chmod +x /usr/local/bin/git-credential-env

# Configure Git to use the custom Git credential helper
RUN git config --global credential.helper env

