
# Project Setup Instructions
## All commands are in rerunConatiner.sh
## 1. Install Dependencies
Run this after updating the Gemfile:  
```bash
docker run --rm -v "$PWD":/app -w /app ruby:3.2.2 bundle install
```

**NOTE for Apple silicon users:**  
```bash
export DOCKER_DEFAULT_PLATFORM=linux/amd64
```

## 2. Build and Run Containers
### Build the Web Container
```bash
docker-compose build web
```

### Start the Database Container
```bash
docker-compose up --detach db
```

**OPTIONAL:** Verify the container is up:  
```bash
docker-compose ps
```

## 3. Setup the Database
### Create the Database
```bash
docker-compose run web rails db:create
```

### Create the Schema File
```bash
docker-compose run web rails db:migrate
```

The schema file can be found at `db/schema.rb` if you want to commit it.

## 4. Start the Development Server
```bash
docker-compose up
```

Access the application using `http://localhost:3000`.

---

## Possible Changes
If you encounter permission issues with the database container, you may need to update the `volumes` section in `docker-compose.yml`. Change:
```yaml
volumes:
  - ./tmp/db:/var/lib/postgresql/data
```

To:
```yaml
volumes:
  - db-data:/var/lib/postgresql/data
```

This avoids permission issues and aligns with standard practices. Consider whether using `tmp` has specific purposes before making the change.

---

## Additional Commands
If you encounter issues during migrations, try the following commands:

1. Reset the database and rerun migrations:
   ```bash
   docker-compose run web rails db:migrate:reset
   ```

2. If that doesn’t work, drop and recreate the database:
   ```bash
   docker-compose run web rails db:drop
   docker-compose run web rails db:create
   ```

3. Then rerun migrations:
   ```bash
   docker-compose run web rails db:migrate
   ```
