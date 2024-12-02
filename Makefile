init:
	-@docker network create global-traefik
	docker compose up -d

start:
	docker compose up -d

stop:
	docker compose down

restart: stop start
