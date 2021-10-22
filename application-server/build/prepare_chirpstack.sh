#!/bin/bash

# This script have to be duplicated in all the services, because Docker doesn't support
# copying files into container from outside the current working directory.

# Install runtime dependencies
apt-get install -y crudini

# Prepare Chirpstack packages
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1CE2AFD36DBCCA00
echo "deb https://artifacts.chirpstack.io/packages/3.x/deb stable main" | tee /etc/apt/sources.list.d/chirpstack.list
apt-get update
