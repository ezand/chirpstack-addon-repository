#!/bin/bash

echo "Initiating PostgreSQL database for Chirpstack..."
docker exec -it postgres psql -U postgres -f /var/lib/postgresql/sql/network-server.sql
docker exec -it postgres psql -U postgres -f /var/lib/postgresql/sql/application-server.sql
