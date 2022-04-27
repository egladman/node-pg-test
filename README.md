## Build

```
docker build . --tag pgtest:latest
```

## Run


### Database

Run local postgres container
```
docker run --name pgtest-db --env POSTGRES_PASSWORD=password --detach --publish 5432:5432 postgres:12
```


### Client

#### Docker

```
docker run --network host pgtest:latest
```

#### Host

```
PGUSER=postgres PGHOST=0.0.0.0 PGPASSWORD=password PGDATABASE=postgres PGPORT=5432 node app.js
```
