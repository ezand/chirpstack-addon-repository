#!/bin/bash

docker stop "$(docker ps -aqf 'name=chirpstack-application-server-addon')"