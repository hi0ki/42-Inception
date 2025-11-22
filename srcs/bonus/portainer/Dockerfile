FROM debian:stable-slim

# Install curl
RUN apt-get update && apt-get install -y curl

# Download Portainer binary (Community Edition)
RUN curl -L https://github.com/portainer/portainer/releases/download/2.20.3/portainer-2.20.3-linux-amd64.tar.gz \
    -o portainer.tar.gz && \
    tar -xzf portainer.tar.gz -C / && \
    mv /portainer /usr/local/bin/portainer && \
    rm -f portainer.tar.gz

CMD ["/usr/local/bin/portainer/portainer"]