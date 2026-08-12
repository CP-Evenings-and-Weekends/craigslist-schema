docker build -t craigslist_db .
docker run --name craigslist_db --rm -e POSTGRES_PASSWORD=password -p 5435:5432 -d craigslist_db
sleep 3
docker exec -it craigslist_db psql -U postgres -d craigslist