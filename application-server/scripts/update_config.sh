#!/usr/bin/with-contenv bashio
# shellcheck shell=bash

# This script have to be duplicated in all the services, because Docker doesn't support
# copying files into container from outside the current working directory.

SERVICE=chirpstack-application-server
CONFIG="$(bashio::config '')"
CONFIG_FILE="/etc/$SERVICE/$SERVICE.toml"
CHECKSUM_FILE=/conf/checksum
CONFIG_CHECKSUM=$(md5sum<<<"$CONFIG")

set_config_from_value() {
  VAL="$3"
  if [ $# -eq 4 ]; then
    if [ -n "$VAL" ]; then
      VAL="[]"
    else
      VAL=[${VAL//$4/,}]
    fi
  fi
  
  crudini --set $CONFIG_FILE "$1" "$2" "$VAL"
}

set_config() {
  VAL="$(jq "$3" <<< "$CONFIG")"
  if [ $# -eq 4 ]; then
    set_config_from_value "$1" "$2" "$VAL" "$4"
  else
    set_config_from_value "$1" "$2" "$VAL"
  fi
}

do_update_config() {
  echo "TODO"
}

if test -f "$CHECKSUM_FILE"; then
  EXISTING_CHECKSUM=$(<$CHECKSUM_FILE)
  if [ "$EXISTING_CHECKSUM" == "$CONFIG_CHECKSUM" ]; then
    bashio::log.info "No changes to configuration since last time."
  else
    bashio::log.info "Configuration has changed since last time!"
    do_update_config
    md5sum<<<"$CONFIG" > $CHECKSUM_FILE
    bashio::log.info "Updated config checksum: $CHECKSUM_FILE"
  fi
else
  do_update_config
  md5sum<<<"$CONFIG" > $CHECKSUM_FILE
  bashio::log.info "Created new config checksum: $CHECKSUM_FILE"
fi
