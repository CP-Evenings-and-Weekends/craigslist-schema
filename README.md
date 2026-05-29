# Design Craigslist

Design and implement a Postgres schema for a simplified version of Craigslist — then load fake data and write queries against it.

The included `init.sql` and `Dockerfile` are set up the same way as the [cars-database](https://github.com/CP-Evenings-and-Weekends/cars-database) so you can spin up your db with `docker build` + `docker run`.

## Feature set to support

Aim for the feature set Craigslist had at launch, not the version we have today.  Your schema should support:

- **Users** can sign up (name, email, password — same pattern as the cars-database)
- **Ads** belong to a user, have a title, body, price, and a posting date
- Every ad belongs to **one category** (think: "for sale", "housing", "jobs", "services")
- Every ad has a **location** (city or neighborhood)
- An ad **expires** after some number of days — model the expiration as part of the schema, not as application logic
- A user can **save** ads they're interested in (a many-to-many relationship)

## Requirements

### 1. Design the schema

Sketch it out on paper or in [dbdiagram.io](https://dbdiagram.io/) / [Quick Database Diagrams](https://www.quickdatabasediagrams.com/) first.  Commit the diagram as `erd.png` (or as a Mermaid `erDiagram` block in `erd.md`).

You'll likely have at least: `users`, `ads`, `categories`, `locations`, and a join table for saved ads.

### 2. Implement in `init.sql`

Translate your diagram into `CREATE TABLE` statements with primary keys, foreign keys, and appropriate constraints (`NOT NULL`, `UNIQUE`, `CHECK`).  Use the same conventions as cars-database (plural table names, lowercase, `id` primary keys, `_id` foreign keys).

### 3. Seed it with fake data

Either write `INSERT` statements by hand or generate fake data with [Mockaroo](https://www.mockaroo.com/) and import as CSV.  You want at least:
- 10 users
- 30 ads spread across at least 4 categories and 3 locations
- Some users with multiple saved ads

### 4. Build + run + query

```bash
docker build -t craigslist_db .
docker run --name craigslist --rm -e POSTGRES_PASSWORD=password -p 5454:5432 -d craigslist_db
PGPASSWORD=password psql -h localhost -p 5454 -U postgres -d craigslist
```

Write 5+ queries that exercise your schema:
- All ads in a given category
- Ads in a given location, sorted by post date
- All ads a specific user has saved
- The most active poster (user with the most ads)
- The most popular category (most ads)

Commit these as `queries.sql`.

## Things to think about
- Is a "category" a single string column on `ads`, or a foreign key to a `categories` table?  Why does the latter scale better?
- A user can save many ads, and an ad can be saved by many users.  That's many-to-many — how do you model it?
- Ad expiration: store `expires_at` directly, or compute it from `posted_at` + a category-default-lifetime?  What are the tradeoffs?
- Categories on real Craigslist nest (e.g. "for sale" → "electronics" → "computers").  How would your schema represent a hierarchy?

## Stretch
- Add support for **multiple images** per ad (another join table).
- Add a **flagged** mechanism — users can report an ad as spam.  Track who flagged it and when.
- Add a `search_text` column or trigger that combines title + body for full-text search, then write a query using `to_tsvector` / `to_tsquery`.
- Add an `EXPLAIN ANALYZE` on one of your queries, then add an index that improves it.

> Stuck? Have a code error? Use the ["4 Before Me"](https://docs.google.com/document/d/1nseOs5oabYBKNHfwJZNAR7GlU0zkZxNagsw63AD7XV0/edit) debugging checklist to help you solve it!
