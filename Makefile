.PHONY: irb up create_migration migrate

build:
	docker compose build
up:
	docker compose up
create_migration:
	docker compose exec app bundle exec rake db:create_migration
migrate:
	docker compose exec app bundle exec rake db:migrate
irb:
	docker compose exec app bundle exec irb -I. -r src/app.rb
