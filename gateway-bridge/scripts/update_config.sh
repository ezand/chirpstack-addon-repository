#!/usr/bin/with-contenv bashio
# shellcheck shell=bash

# This script have to be duplicated in all the services, because Docker doesn't support
# copying files into container from outside the current working directory.

SERVICE=chirpstack-gateway-bridge
CONFIG="$(bashio::config '')"
CONFIG_FILE=/etc/$SERVICE/$SERVICE.toml
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
  set_config general log_level ".log_level"
  set_config general log_to_syslog ".log_to_syslog"
  set_config filters net_ids ".filters.net_ids" ","
  set_config filters join_euis ".filters.join_euis" ","
  set_config backend type ".backend"
  set_config backend.semtech_udp udp_bind ".semtech_udp.bind"
  set_config backend.semtech_udp skip_crc_check ".semtech_udp.skip_crc_check"
  set_config backend.semtech_udp fake_rx_time ".semtech_udp.fake_rx_time"
  set_config backend.concentratord crc_check ".concentratord.crc_check"
  set_config backend.concentratord event_url ".concentratord.event_url"
  set_config backend.concentratord command_url ".concentratord.command_url"
  set_config backend.basic_station bind ".basic_station.bind"
  set_config backend.basic_station stats_interval ".basic_station.stats_interval"
  set_config backend.basic_station ping_interval ".basic_station.ping_interval"
  set_config backend.basic_station read_timeout ".basic_station.read_timeout"
  set_config backend.basic_station write_timeout ".basic_station.write_timeout"
  set_config backend.basic_station region ".basic_station.region"
  set_config backend.basic_station frequency_min ".basic_station.frequency_min"
  set_config backend.basic_station frequency_max ".basic_station.frequency_max"
  set_config integration marshaler ".marshaler"
  set_config integration.mqtt event_topic_template ".mqtt.event_topic_template"
  set_config integration.mqtt state_topic_template ".mqtt.state_topic_template"
  set_config integration.mqtt command_topic_template ".mqtt.command_topic_template"
  set_config integration.mqtt state_retained ".mqtt.state_retained"
  set_config integration.mqtt keep_alive ".mqtt.keep_alive"
  set_config integration.mqtt max_reconnect_interval ".mqtt.max_reconnect_interval"
  set_config integration.mqtt terminate_on_connect_error ".mqtt.terminate_on_connect_error"
  set_config integration.mqtt.auth type ".mqtt.auth_type"
  set_config integration.mqtt.auth.generic servers ".mqtt_generic.servers" ","
  set_config integration.mqtt.auth.generic username ".mqtt_generic.username"
  set_config integration.mqtt.auth.generic password ".mqtt_generic.password"
  set_config integration.mqtt.auth.generic qos ".mqtt_generic.qos"
  set_config integration.mqtt.auth.generic clean_session ".mqtt_generic.clean_session"
  set_config integration.mqtt.auth.generic client_id ".mqtt_generic.client_id"
  set_config integration.mqtt.auth.gcp_cloud_iot_core server ".mqtt_google.server"
  set_config integration.mqtt.auth.gcp_cloud_iot_core device_id ".mqtt_google.device_id"
  set_config integration.mqtt.auth.gcp_cloud_iot_core project_id ".mqtt_google.project_id"
  set_config integration.mqtt.auth.gcp_cloud_iot_core registry_id ".mqtt_google.registry_id"
  set_config integration.mqtt.auth.gcp_cloud_iot_core jwt_expiration ".mqtt_google.jwt_expiration"
  set_config integration.mqtt.auth.azure_iot_hub device_connection_string ".mqtt_azure.device_connection_string"
  set_config integration.mqtt.auth.azure_iot_hub sas_token_expiration ".mqtt_azure.sas_token_expiration"
  set_config integration.mqtt.auth.azure_iot_hub device_id ".mqtt_azure.device_id"
  set_config integration.mqtt.auth.azure_iot_hub hostname ".mqtt_azure.hostname"
  set_config metrics.prometheus enabled ".prometheus.enabled"
  set_config metrics.prometheus bind ".prometheus.bind"
  while IFS=',' read -ra ENTRY; do
    for x in "${ENTRY[@]}"; do
      KEY=${x%=*}
      VAL=${x##*=}
      set_config_from_value meta_data.static "$(echo "$KEY" | xargs)" "$(echo "$VAL" | xargs)"
    done
  done <<< "$(jq -r '.static_meta_data' <<< "$CONFIG")"
  set_config meta_data.dynamic execution_interval ".dynamic_meta_data.execution_interval"
  set_config meta_data.dynamic max_execution_duration ".dynamic_meta_data.max_execution_duration"
  set_config meta_data.dynamic split_delimiter ".dynamic_meta_data.split_delimiter"
  while IFS=',' read -ra ENTRY; do
    for x in "${ENTRY[@]}"; do
      KEY=${x%=*}
      VAL=${x##*=}
      set_config_from_value meta_data.dynamic.commands "$(echo "$KEY" | xargs)" "$(echo "$VAL" | xargs)"
    done
  done <<< "$(jq -r '.dynamic_meta_data.commands' <<< "$CONFIG")"
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
