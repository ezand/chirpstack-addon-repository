#!/bin/bash

docker exec -it "$(docker ps -aqf 'name=chirpstack-network-server-addon')" /bin/bash 