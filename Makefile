.PHONY: create drop irb up create_migration migrate

# Project
build:
	docker compose build
up:
	docker compose up app
irb:
	docker compose exec app bundle exec irb -I. -r src/app.rb

# Migrations

T:
	docker compose exec app bundle exec rake -T
drop:
	docker compose exec app bundle exec rake db:drop
create:
	docker compose exec app bundle exec rake db:create
migrate:
	docker compose exec app bundle exec rake db:migrate
create_migration:
	docker compose exec app bundle exec rake db:create_migration
