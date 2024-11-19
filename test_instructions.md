1. Run this after updating the Gemfile: `docker run --rm -v "$PWD":/app -w /app ruby:3.2.2 bundle install`

NOTE for Apple silicon users: export DOCKER_DEFAULT_PLATFORM=linux/amd64

2. build web container: `docker-compose build web`

3. start db container: `docker-compose up --detach db`

OPTIONAL: verify container is up: `docker-compose ps`

4. create db: `docker-compose run web rails db:create`

5. create schema file: `docker-compose run web rails db:migrate`

can be found at (db/schema.rb) if you want to commit it.

6. start dev server: `docker-compose up`

access using localhost:3000
