ARG UPSTREAM_REGISTRY=docker.io
ARG DEBIAN_VERSION=bullseye
ARG NODE_VERSION=16

FROM node:${NODE_VERSION}-${DEBIAN_VERSION}

RUN set -eux; \
    apt-get update; \
    apt-get install libpq-dev; \
    rm -rf /var/lib/apt/lists/*; \
    mkdir /app

WORKDIR /app

COPY app.js .
COPY package*.json .

RUN set -eux; \
    npm install . pg-native

ENV PGDATABASE=postgres 
ENV PGHOST=0.0.0.0
ENV PGPORT=5432
ENV PGUSER=postgres
ENV PGPASSWORD=password

ENTRYPOINT ["node", "app.js"]

