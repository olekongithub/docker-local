include .env

.PHONY: up down stop start prune ps shell restart

default: up

up: start

start:
	@echo "Starting up containers for $(PROJECT_NAME)..."
	@docker-sync start
	docker-compose pull --parallel
	docker-compose up -d --remove-orphans

down: stop

stop:
	@echo "Stopping containers for $(PROJECT_NAME)..."
	@docker-compose stop
	@docker-sync stop

restart: down
	@echo "Restarting containers for $(PROJECT_NAME)..."
	@echo "Stopping containers for $(PROJECT_NAME)..."
	@docker-compose stop
	@docker-sync stop
	@echo "Starting up containers for $(PROJECT_NAME)..."
	@docker-sync start
	@docker-compose pull --parallel
	@docker-compose up -d --remove-orphans

prune:
	@echo "Removing containers for $(PROJECT_NAME)..."
	@docker-compose down -v

ps:
	@docker ps --filter name='$(PROJECT_NAME)*'

shell:
	docker exec -ti $(shell docker ps --filter name='$(PROJECT_NAME)_nginx' --format "{{ .ID }}") sh