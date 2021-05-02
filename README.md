This simple service will allow registered users to create shortened versions of
URLs they provide. It will also provide simple analytics by recording how many
times the shortened URL is used.

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

5. Either register or use seeded accounts with 
  * Email: `user-1@mail.com` - `user-5@mail.com`
  * Password: `password`
