#!/bin/bash

docker exec -it "$(docker ps -aqf 'name=chirpstack-application-server-addon')" /bin/bash 