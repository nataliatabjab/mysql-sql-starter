# SQL Notes

---

## Nice organization
- Put all your **`CREATE TABLE`** and **`INSERT`** statements into one `.sql` file.  
- Put all your **`SELECT` / practice queries** into another `.sql` file.  

---

## 1. Executing an SQL file from a Docker container

```bash
docker exec -i <container_name> mysql -u <username> -p<password> < path/to/file.sql
```

- `-i` = **interactive**.  
  - Tells Docker: *“Keep STDIN (standard input) open, because I’m going to feed something into this command.”*  
- Without `-i`, the redirect `< file.sql` wouldn’t work because Docker wouldn’t be listening for input.  

---

## 2. Getting into the MySQL shell using Docker

```bash
docker exec -it <container_name> mysql -u <username> -p<password> <database_name>
```

- `-it` = interactive + terminal.  
- Drops you into the **MySQL CLI** (`mysql>` prompt).  
- Optional: `<database_name>` connects you directly into a specific DB.  

---

## What is Docker?

- An open-source platform that facilitates the **development, shipping, and running** of applications using **containerization**.  
- It packages software and all its dependencies into standardized units called **containers**.  

---

## Example `docker-compose.yml` file

```yaml
services:
  mysql:
    image: mysql:8.0
    container_name: mysql_learn
    environment:
      MYSQL_ROOT_PASSWORD: rootpass
      MYSQL_DATABASE: learn
      MYSQL_USER: appuser
      MYSQL_PASSWORD: apppass
      MYSQL_TCP_PORT: 3307
    ports:
      - "3307:3307"
    volumes:
      - mysqldata:/var/lib/mysql

  adminer:
    image: adminer
    container_name: adminer_learn
    restart: always
    ports:
      - "8081:8080"
    environment:
      - ADMINER_DEFAULT_SERVER=mysql
```

---

## Breaking it down

- **services** → each block = a container we want to run.  
  - `mysql` → the actual database engine.  
  - `adminer` → a browser-based GUI to talk to the DB.  

- **image: mysql:8.0**  
  - “Download the official MySQL 8.0 blueprint from Docker Hub.”  

- **environment** → predefined variables:  
  - `MYSQL_ROOT_PASSWORD` = root password.  
  - `MYSQL_DATABASE` = create DB `learn` on startup.  
  - `MYSQL_USER` / `MYSQL_PASSWORD` = normal user account.  

- **ports: "3307:3307"**  
  - Left side (3307) → your Mac’s port.  
  - Right side (3307) → port inside the container.  
  - Translation: `localhost:3307` on your Mac forwards into the container.  

- **volumes** → persistence.  
  - Without this, restarting wipes your DB.  
  - `mysqldata:/var/lib/mysql` = *“store MySQL’s data in a named volume called mysqldata on disk.”*  

- **adminer service**  
  - Lightweight Adminer image.  
  - Exposes port 8080 inside → mapped to 8081 on your Mac.  
  - Visit [http://localhost:8081](http://localhost:8081) to open Adminer, which connects to MySQL internally.  
