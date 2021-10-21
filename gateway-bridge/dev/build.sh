#!/bin/bash

if [[ $1 == "no-cache" ]]; then
    docker build --no-cache -t ezand/chirpstack-gateway-bridge-addon --build-arg BUILD_FROM=homeassistant/amd64-base-debian:latest .
else
    docker build -t ezand/chirpstack-gateway-bridge-addon --build-arg BUILD_FROM=homeassistant/amd64-base-debian:latest .
fi
