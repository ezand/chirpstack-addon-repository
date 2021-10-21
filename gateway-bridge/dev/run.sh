#!/bin/bash

if [[ $1 == "no-daemon" ]]; then
  docker run --rm -p 3001:3001 -p 1700:1700 --name chirpstack-gateway-bridge-addon ezand/chirpstack-gateway-bridge-addon
else
  docker run -d -it --rm -p 3001:3001 -p 1700:1700 --name chirpstack-gateway-bridge-addon ezand/chirpstack-gateway-bridge-addon
fi
