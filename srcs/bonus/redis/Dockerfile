FROM debian:stable-slim

RUN apt-get update && apt-get install -y \
    redis-server \
    && apt-get clean

EXPOSE 6379

CMD ["redis-server", "--protected-mode", "no", "--bind", "0.0.0.0"]

# redis-cli MONITOR
# redis-cli DBSIZE