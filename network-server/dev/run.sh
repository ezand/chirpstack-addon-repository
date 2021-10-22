#!/bin/bash

if [[ $1 == "no-daemon" ]]; then
  docker run --rm -p 8000:8000 -p 8010:8010 -p 9091:9091 --name chirpstack-network-server-addon ezand/chirpstack-network-server-addon
else
  docker run -d -it --rm -p 8000:8000 -p 8010:8010 -p 9091:9091 --name chirpstack-network-server-addon ezand/chirpstack-network-server-addon
fi
