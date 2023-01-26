# Running postgres database from Docker

```
docker run -it                                                      \
    -e POSTGRES_USER="root"                                         \
    -e POSTGRES_PASSWORD="root"                                     \
    -e POSTGRES_DB="root"                                           \
    -v $(pwd)/Week1/ny_taxi_postgres_data:/var/lib/postgres/data    \
    -p 5432:5432                                                    \
    postgres:13
```


```
pgcli -h localhost -p 5432 -u root -d ny_taxi
```


```
docker run                                      \
    -e PGADMIN_DEFAULT_EMAIL="admin@admin.com"  \
    -e PGADMIN_DEFAULT_PASSWORD="root"          \
    -p 8080:80                                  \
    dpage/pgadmin4
```

## Using network

```
docker network create pg-network

docker run -it                                                      \
    -e POSTGRES_USER="root"                                         \
    -e POSTGRES_PASSWORD="root"                                     \
    -e POSTGRES_DB="root"                                           \
    -v $(pwd)/Week1/ny_taxi_postgres_data:/var/lib/postgres/data    \
    -p 5432:5432                                                    \
    --network=pg-network                                            \
    --name pg-database                                              \
    postgres:13


docker run                                      \
    -e PGADMIN_DEFAULT_EMAIL="admin@admin.com"  \
    -e PGADMIN_DEFAULT_PASSWORD="root"          \
    -p 8080:80                                  \
    --network=pg-network                                            \
    --name pg-admin                                                 \
    dpage/pgadmin4
```

## Ingest with python script
```
URL="https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green/green_tripdata_2019-01.csv.gz"

python Week1/ingest_data.py \
  --user=root \
  --password=root \
  --host=localhost \
  --port=5432 \
  --db=ny_taxi \
  --table_name=green_taxi_trips \
  --url=${URL}
```

### Dockerized
```
docker build -t taxi_ingest:v001 -f Week1/.Dockerfile Week1

docker run                          \
    --network=pg-network            \
    taxi_ingest:v001                \
    --user=root                     \
    --password=root                 \
    --host=localhost                \
    --port=5432                     \
    --db=ny_taxi                    \
    --table_name=yellow_taxi_trips  \
    --url=${URL}
```

# Terraform

``` 
export GOOGLE_APPLICATION_CREDENTIALS="Week1/credentials/$(ls Week1/credentials/)"
gcloud auth application-default login
```