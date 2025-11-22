all :
	@docker compose -f srcs/docker-compose.yml up -d --build

build :
	@docker compose -f srcs/docker-compose.yml build
up :
	@docker compose -f srcs/docker-compose.yml up -d
down :
	@docker compose -f srcs/docker-compose.yml down --remove-orphans -v
logs :
	@docker compose -f srcs/docker-compose.yml logs
ps :
	@docker compose -f srcs/docker-compose.yml ps
