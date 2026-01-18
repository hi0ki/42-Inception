# Inception

My take on the 42 Inception project - setting up a small infrastructure with Docker.

## What I learned

This project was pretty eye-opening honestly. Got hands-on experience with Docker, learned how to properly configure NGINX with SSL, set up WordPress without using the easy install button, and figured out how to make containers talk to each other securely. The bonus parts were fun too - setting up Redis caching made WordPress noticeably faster, FTP was interesting for file management, Portainer is super handy for visualizing what's going on with the containers, and building my own resume site from scratch was a nice touch. The whole microservices thing makes a lot more sense now.

## Overview

Basically, I had to create a mini web server setup using Docker containers. Everything runs in separate containers that I built from scratch (no pulling ready-made images from Docker Hub).

The setup includes:
- **NGINX** - web server handling HTTPS (TLSv1.2/1.3)
- **WordPress** - the actual website, running with PHP-FPM
- **MariaDB** - database for WordPress
- **Redis** - caching for WordPress (bonus)
- **FTP** - file transfer server (bonus)
- **Portainer** - Docker management UI (bonus)
- **Personal Resume** - static website with my resume (bonus)

## Structure

```
.
├── Makefile
└── srcs/
    ├── docker-compose.yml
    ├── requirements/
    │   ├── nginx/
    │   ├── wordpress/
    │   ├── mariadb/
    │   ├── redis/          (bonus)
    │   ├── ftp/            (bonus)
    │   ├── portainer/      (bonus)
    │   └── resume/         (bonus)
    └── .env
```
