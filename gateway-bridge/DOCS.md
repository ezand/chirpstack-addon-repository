# Chirpstack Gateway Bridge

![Supports aarch64 Architecture][aarch64-shield] ![Supports amd64 Architecture][amd64-shield] ![Supports armhf Architecture][armhf-shield] ![Supports armv7 Architecture][armv7-shield] ![Supports i386 Architecture][i386-shield]

This add-on provides a Chirpstack Gateway Bridge for your network. The Gateway Bridge may also be installed [directly on the gateway][gateway-bridge-gateway] instead of using this add-on. Be sure to check out the [deployment strategies][gateway-bridge-deployment] before you consider that option.

[ChirpStack Gateway Bridge][gateway-bridge] is a service which converts LoRa® Packet Forwarder protocols into a ChirpStack Network Server [common data-format][common-data-format] (JSON and Protobuf). This component is part of the ChirpStack open-source LoRaWAN® Network Server stack.

## Prerequisites

* A running PostgreSQL database.
* A running Redis server.
* A supported backend:
  * `semtech_udp`: a running [Semtech UDP packet-forwarder][semtech-udp]. Might be running on the gateway itself.
  * `concentratord`: a running LoRa(WAN) [concentrator][contractord] daemon.
  * `basic_station`: an accessible [basic station][basic-station] websocket.
* A supported event mechanism:
  * `mqtt`: a running MQTT broker.
  * `gcp_cloud_iot_core`: access to a Google Cloud IoT Core MQTT broker.
  * `azure_iot_hub`: access to an Azure IoT Hub MQTT broker.

## Configuration

Refer to the [Chirpstack documentation][gateway-bridge-config] for configuration details.

| Key | Default | Note |
:--- | :-- | :--- |
| `log_level` | `4` | |
| `log_to_syslog` | `false` | |
| `filters.net_ids` | `<empty string>` | Comma-separated string, ex '000000,000001' |
| `filters.join_euis` | `<empty string>` | Comma-separated string, ex '["0000000000000000", "00000000000000ff"],["000000000000ff00", "000000000000ffff"]' |
| `backend` |  `semtech_udp` | |
| `semtech_udp.bind` | `0.0.0.0:1700` | Bind port must always be `1700`, you can map the external port in the port-mapping. |
| `semtech_udp.skip_crc_check` | `false` | |
| `semtech_udp.fake_rx_time` | `false` | |
| `concentratord.crc_check` | `true` | |
| `concentratord.event_url` | `<empty string>` | |
| `concentratord.command_url` `<empty string>` | |
| `basic_station.bind` | `0.0.0.0:3001` | Bind port must always be `3001`, you can map the external port in the port-mapping. |
| `basic_station.stats_interval` | `30s` | |
| `basic_station.ping_interval` | `1m0s` | |
| `basic_station.read_timeout` | `1m5s` | |
| `basic_station.write_timeout` | `1s` | |
| `basic_station.region` | `EU868` | |
| `basic_station.frequency_min` | `863000000` | |
| `basic_station.frequency_max` |  `870000000` | |
| `marshaler` | `protobuf` | |
| `mqtt.event_topic_template` | `gateway/{{ .GatewayID }}/event/{{ .EventType }}` | |
| `mqtt.state_topic_template` | `gateway/{{ .GatewayID }}/state/{{ .StateType }}` | |
| `mqtt.command_topic_template` | `gateway/{{ .GatewayID }}/command/#` | |
| `mqtt.state_retained` | `true` | |
| `mqtt.keep_alive` | `30s` | |
| `mqtt.max_reconnect_interval` | `1m0s` | |
| `mqtt.terminate_on_connect_error` | `false` | |
| `mqtt.auth_type` | `generic` | |
| `mqtt_generic.servers` | `<empty string>` | Comma separated list of server-urls. Ex `tcp://127.0.0.1:1883` |
| `mqtt_generic.username` | `<empty string>` | |
| `mqtt_generic.password` | `<empty string>` | |
| `mqtt_generic.qos` | `0` | |
| `mqtt_generic.clean_session` | `true` | |
| `mqtt_generic.client_id` | `cng_ha_addon` | |
| `mqtt_google.server` | `ssl://mqtt.googleapis.com:8883` | |
| `mqtt_google.device_id` | `<empty string>` | |
| `mqtt_google.project_id` | `<empty string>` | |
| `mqtt_google.registry_id` | `<empty string>` | |
| `mqtt_google.registry_id` | `<empty string>` | |
| `mqtt_google.jwt_expiration` | `<empty string>` | |
| `mqtt_azure.device_connection_string` | `<empty string>` | |
| `mqtt_azure.sas_token_expiration` | | `24h0m0s` | |
| `mqtt_azure.device_id` | `<empty string>` | |
| `mqtt_azure.hostname` | `<empty string>` | |
| `prometheus.enabled` | `false` | |
| `prometheus.bind` | `<empty string>` | Bind port must always be `9090`, you can map the external port in the port-mapping. |
| `static_meta_data` | `<empty string>` | Static comma separated list of key (string) / value (string) meta-data. Ex. `serial_number="A1B21234",ha_version="2021.10.6"` |
| `dynamic_meta_data.execution_interval` | `1m0s` | |
| `dynamic_meta_data.max_execution_duration` | `1s` | |
| `dynamic_meta_data.split_delimiter` | `=` | |
| `dynamic_meta_data.commands` | `<empty string>` | Comma separated list of commands to execute. Ex. `temperature="/opt/gateway-temperature/gateway-temperature.sh` |

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[gateway-bridge]: https://www.chirpstack.io/gateway-bridge/
[gateway-bridge-config]: https://www.chirpstack.io/gateway-bridge/install/config/
[gateway-bridge-gateway]: https://www.chirpstack.io/gateway-bridge/gateway/
[gateway-bridge-deployment]: https://www.chirpstack.io/gateway-bridge/install/deployment/
[common-data-format]: https://github.com/brocaar/chirpstack-api/blob/master/protobuf/gw/gw.proto
[contractord]: https://www.chirpstack.io/gateway-bridge/backends/concentratord/
[semtech-udp]: https://www.chirpstack.io/gateway-bridge/backends/semtech-udp/
[basic-station]: https://www.chirpstack.io/gateway-bridge/backends/basic-station/