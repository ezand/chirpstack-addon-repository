#!/usr/bin/with-contenv bashio
# shellcheck shell=bash

#CONFIG_PATH=/data/options.json

CONFIG="$(bashio::config '')"

# Keep container running
tail -f /dev/null
