start:
	- docker-compose up -d

setup:
	- docker-compose run url-shortener rake db:create
