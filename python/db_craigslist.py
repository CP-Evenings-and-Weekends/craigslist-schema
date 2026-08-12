import psycopg2

with psycopg2.connect(
    host="localhost",
    port="5435",  # the port on your host machine that will forward requests to 5432 in the container
    database="craigslist",
    user="postgres",
    password="password") as conn:
    with conn.cursor() as cursor:
        cursor.execute("SELECT * FROM ads")
        data = cursor.fetchall()

        for d in data:
            if d[5] < 10:
                print(d[3], d[5]) # print title and price together
