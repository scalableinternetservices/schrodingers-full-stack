docker run --rm -v "$PWD":/app -w /app ruby:3.2.2 bundle install
docker-compose build web
docker-compose up --detach db
docker-compose run web rails db:create
docker-compose run web rails db:migrate
docker-compose up