APP_POD ?= url-shortener

start:
	docker-compose up -d

setup:
	docker-compose exec ${APP_POD} bash -c \
		'RAILS_ENV=development rails db:reset db:environment:set'

bash:
	docker-compose exec ${APP_POD} bash

pipeline:
	docker-compose exec ${APP_POD} bash -c 'rubocop && rspec'
