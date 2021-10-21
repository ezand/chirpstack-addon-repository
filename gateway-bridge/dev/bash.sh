#!/bin/bash

docker exec -it "$(docker ps -aqf 'name=chirpstack-gateway-bridge-addon')" /bin/bash 