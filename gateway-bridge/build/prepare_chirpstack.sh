#!/bin/bash

# Install runtime dependencies
apt-get install -y crudini

# Prepare Chirpstack packages
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1CE2AFD36DBCCA00
echo "deb https://artifacts.chirpstack.io/packages/3.x/deb stable main" | tee /etc/apt/sources.list.d/chirpstack.list
apt-get update
