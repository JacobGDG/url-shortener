start:
	- docker-compose up -d

setup:
	- docker-compose run url-shortener rake db:create

bash:
	- docker-compose exec url-shortener bash

pipeline:
	- docker-compose exec url-shortener rubocop
