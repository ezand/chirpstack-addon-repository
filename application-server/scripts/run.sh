#!/usr/bin/with-contenv bashio
# shellcheck shell=bash

# This script have to be duplicated in all the services, because Docker doesn't support
# copying files into container from outside the current working directory.

#CONFIG_PATH=/data/options.json

CONFIG="$(bashio::config '')"

# Keep container running
tail -f /dev/null
