FROM python:3.12-slim

WORKDIR /src

RUN pip install psycopg2-binary

COPY db_script.py ./

CMD ["python", "db_craigslist.py"]