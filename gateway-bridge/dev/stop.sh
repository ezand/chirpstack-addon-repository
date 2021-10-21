#!/bin/bash

docker stop "$(docker ps -aqf 'name=chirpstack-gateway-bridge-addon')"