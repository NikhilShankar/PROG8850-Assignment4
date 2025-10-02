
# Assignment 4 — Database Migrations with Flyway, Ansible & CI/CD

This starter repo scaffolds everything you need for PROG8850 Assignment 4.

## What you will do
1) **Q1 (PDF report):** Compare any two tools (Liquibase, Flyway, Alembic, EF Core) and propose a CI/CD integration strategy.
2) **Q2 (Hands-on with Flyway):**
   - Use **Ansible** `ansible/up.yml` and `ansible/down.yml` to scaffold & tear down a MySQL environment.
   - `up.yml` also runs **initial Flyway migrations** (via GitHub Actions locally with **nektos/act** or directly with Flyway CLI).
   - Create **two migration folders**: `flyway/migrations_initial` and `flyway/migrations_incremental`.
   - Build a subscribers DB with CRUD tests and CI.

## Quick start (local)
```bash
docker run --name a4-mysql -e MYSQL_ROOT_PASSWORD=rootpass -e MYSQL_DATABASE=subscriptions -p 3306:3306 -d mysql:8

docker run --rm -v $(pwd)/flyway:/flyway/sql --network host flyway/flyway:10   -url=jdbc:mysql://localhost:3306/subscriptions   -user=root -password=rootpass   -locations=filesystem:/flyway/migrations_initial migrate

docker run --rm -v $(pwd)/flyway:/flyway/sql --network host flyway/flyway:10   -url=jdbc:mysql://localhost:3306/subscriptions   -user=root -password=rootpass   -locations=filesystem:/flyway/migrations_incremental migrate

pip install -r requirements.txt
pytest -q
```
