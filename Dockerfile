FROM postgres:15

ENV POSTGRES_DB=craigslist
COPY init.sql /docker-entrypoint-initdb.d/init.sql