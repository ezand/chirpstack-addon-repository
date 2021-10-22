#!/bin/bash

if [[ $1 == "no-daemon" ]]; then
  docker run --rm -p 8001:8001 -p 8080:8080 -p 8003:8003 -p 9092:9092 --name chirpstack-application-server-addon ezand/chirpstack-application-server-addon
else
  docker run -d -it --rm -p 8001:8001 -p 8080:8080 -p 8003:8003 -p 9092:9092 --name chirpstack-application-server-addon ezand/chirpstack-application-server-addon
fi
