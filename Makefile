init:
	-@docker network create global-traefik
	@./genTls.sh
	@docker compose up -d

start:
	@./genTls.sh
	@docker compose up -d

stop:
	@docker compose down

restart: stop start
