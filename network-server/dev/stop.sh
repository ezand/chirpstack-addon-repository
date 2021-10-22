#!/bin/bash

docker stop "$(docker ps -aqf 'name=chirpstack-network-server-addon')"