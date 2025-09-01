# MySQL SQL Starter

A simple SQL project built to practice core relational database skills using Dockerized MySQL and Adminer.

## What this project does
- Runs **MySQL 8.0** + **Adminer** in Docker for a reproducible dev setup.
- Defines a toy schema (`accounts` table) with sample customer data.
- Runs queries covering:
  - Filtering + ORDER BY
  - Aggregates + GROUP BY/HAVING
  - CASE bucketing
  - Window functions (ROW_NUMBER)

## How to run
1. Start services:
   ```bash
   docker compose -f docker/docker-compose.yml up -d
   ```
2. Open Adminer: [http://localhost:8081](http://localhost:8081)
   - System: MySQL
   - Server: mysql
   - Username: appuser
   - Password: apppass
   - Database: learn
3. Run the schema:
   ```sql
   SOURCE sql/schema.sql;
   ```
4. Insert rows (see `sql/schema.sql`) or add your own.
5. Run queries from `sql/practice_queries.sql`.

## Project Relevance
This project demonstrates:
- Comfort with **Dockerized databases**.
- Ability to write SQL covering common **interview patterns**.
- Clear documentation and reproducibility.
