## Start

This service has been dockarised for ease of development and startup.

1. Ensure docker is installed and configured on your machine.
2. Pull the required postgres image and build the `url-shortener` image

```bash
# cd into the repo's root directory
$ make start
```

3. Once the above has complete, setup the development and test DB's.

```bash
$ make setup
```

4. Go to http://localhost:3000/
