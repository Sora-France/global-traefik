init:
	docker network create global-traefik
	docker compose up -d

start:
	docker compose up -d