# Home Assistant Add-on: Chirpstack Gateway Bridge

![Supports aarch64 Architecture][aarch64-shield] ![Supports amd64 Architecture][amd64-shield] ![Supports armhf Architecture][armhf-shield] ![Supports armv7 Architecture][armv7-shield] ![Supports i386 Architecture][i386-shield]

This add-on provides a Chirpstack Gateway Bridge for your network.

[ChirpStack Gateway Bridge][gateway-bridge] is a service which converts LoRa® Packet Forwarder protocols into a ChirpStack Network Server [common data-format][common-data-format] (JSON and Protobuf). This component is part of the ChirpStack open-source LoRaWAN® Network Server stack.

## Configuration
Refer to the [Chirpstack documentation](https://www.chirpstack.io/gateway-bridge/install/config/) for configuration details.

| Key | Mandatory | Default value | Description |
| --- | --- | --- | ---- |
| `log_level` | `false` | `4` | debug=5, info=4, warning=3, error=2, fatal=1, panic=0 |
| `log_to_syslog` | `false` | `false` | When set to `true`, log messages are being written to syslog. |
| `filters.net_ids` | `false` | `<empty string>` | Filter LoRaWAN frames. Comma-separated string, ex '000000,000001' |
| `filters.join_euis` | `false` | `<empty string>` | JoinEUI ranges to be used to filter join-requests. Comma-separated string, ex '["0000000000000000", "00000000000000ff"],["000000000000ff00", "000000000000ffff"]' |
| `backend` | `false` | `semtech_udp` | Gateway backend configuration. Valid options are `semtech_udp`, `concentratord` or `basic_station`. |
| `semtech_udp.bind` | `false` | `0.0.0.0:1700` | ip:port to bind the UDP listener to. Ex. `0.0.0.0:1700`. Bind port must always be `1700`, you can map the external port in the port-mapping. |
| `semtech_udp.skip_crc_check` | `false` | `false` | Skip the CRC status-check of received packets. |
| `semtech_udp.fake_rx_time` | `false` | `false` | Fake RX timestamp. |
| `concentratord.crc_check` | `false` | `true` | Check for CRC OK. |
| `concentratord.event_url` | `false` | `<empty string>` | Event API URL. |
| `concentratord.command_url` | `false` | `<empty string>` | Command API URL. |
| `basic_station.bind` | `false` | `0.0.0.0:3001` | ip:port to bind the Websocket listener to. Ex. `:3001`. Bind port must always be `3001`, you can map the external port in the port-mapping. |
| `basic_station.stats_interval` | `false` | `30s` | This defines the interval in which the ChirpStack Gateway Bridge forwards the uplink / downlink statistics. |
| `basic_station.ping_interval` | `false` | `1m0s` | Ping interval. |
| `basic_station.read_timeout` | `false` | `1m5s` | This interval must be greater than the configured ping interval. |
| `basic_station.write_timeout` | `false` | `1s` | Write timeout. |
| `basic_station.region` | `false` | `EU868` | Please refer to the LoRaWAN Regional Parameters specification for the complete list of common region names. |
| `basic_station.frequency_min` | `false` | `863000000` | Minimal frequency (Hz). Ex `863000000` |
| `basic_station.frequency_max` | `false` | `870000000` | Maximum frequency (Hz). Ex. `870000000` |
| `marshaler` | `false` | `protobuf` | This defines how the MQTT payloads are encoded. Valid options are `protobuf` or `json`. |
| `mqtt.event_topic_template` | `false` | `gateway/{{ .GatewayID }}/event/{{ .EventType }}` | Event topic template. |
| `mqtt.state_topic_template` | `false` | `gateway/{{ .GatewayID }}/state/{{ .StateType }}` | State topic template. |
| `mqtt.command_topic_template` | `false` | `gateway/{{ .GatewayID }}/command/#` | Command topic template. |
| `mqtt.state_retained` | `false` | `true` | State retained. |
| `mqtt.keep_alive` | `false` | `30s` | Keep alive will set the amount of time (in seconds) that the client should wait before sending a PING request to the broker. |
| `mqtt.max_reconnect_interval` | `false` | `1m0s` | Maximum interval that will be waited between reconnection attempts when connection is lost. Ex. `1m0s` |
| `mqtt.terminate_on_connect_error` | `false` | `false` | Terminate on connect error. |
| `mqtt.auth_type` | `false` | `generic` | Valid options are `generic`, `gcp_cloud_iot_core` or `azure_iot_hub` |
| `mqtt_generic.servers` | `true` | `<empty string>` | Comma separated list of server-urls. Ex `tcp://127.0.0.1:1883` |
| `mqtt_generic.username` | `false` | `<empty string>` | Connect with the given username. |
| `mqtt_generic.password` | `false` | `<empty string>` | Connect with the given password. |
| `mqtt_generic.qos` | `false` | `0` | Quality of service level. Valid options are `0`, `1` or `2`. |
| `mqtt_generic.clean_session` | `false` | `true` | Clean session. |
| `mqtt_generic.client_id` | `false` | `cng_ha_addon` | Set the client id to be used by this client when connecting to the MQTT broker. |
| `mqtt_google.server` | `false` | `ssl://mqtt.googleapis.com:8883` | MQTT server. Ex. `ssl://mqtt.googleapis.com:8883` |
| `mqtt_google.device_id` | `false` | `<empty string>` | Google Cloud IoT Core Device id. |
| `mqtt_google.project_id` | `false` | `<empty string>` | Google Cloud project id. |
| `mqtt_google.registry_id` | `false` | `<empty string>` | Google Cloud region. |
| `mqtt_google.registry_id` | `false` | `<empty string>` | Google Cloud IoT registry id. |
| `mqtt_google.jwt_expiration` | `false` | `<empty string>` | JWT token expiration time. Ex. `24h0m0s` |
| `mqtt_azure.device_connection_string` | `false` | `<empty string>` | Device connection string (symmetric key authentication). |
| `mqtt_azure.sas_token_expiration` | `false` | `24h0m0s` | Token expiration (symmetric key authentication). |
| `mqtt_azure.device_id` | `false` | `<empty string>` | Device ID (X.509 authentication). |
| `mqtt_azure.hostname` | `false` | `<empty string>` | IoT Hub hostname (X.509 authentication). |
| `prometheus.enabled` | `false` | `false` | Expose Prometheus metrics endpoint. |
| `prometheus.bind` | `false` | `<empty string>` | The ip:port to bind the Prometheus metrics server to for serving the metrics endpoint. Bind port must always be `9090`, you can map the external port in the port-mapping. |
| `static_meta_data` | `false` | `<empty string>` | Static comma separated list of key (string) / value (string) meta-data. Ex. `serial_number="A1B21234",ha_version="2021.10.6"` |
| `dynamic_meta_data.execution_interval` | `false` | `1m0s` | Execution interval of the commands. Ex. `1m0s` |
| `dynamic_meta_data.max_execution_duration` | `false` | `1s` | Max. execution duration. Ex. `1s` |
| `dynamic_meta_data.split_delimiter` | `false` | `=` | Split delimiter. Ex. `=` |
| `dynamic_meta_data.commands` | `false` | `<empty string>` | Comma separated list of commands to execute. Ex. `temperature="/opt/gateway-temperature/gateway-temperature.sh` |

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[gateway-bridge]: https://www.chirpstack.io/gateway-bridge/
[common-data-format]: https://github.com/brocaar/chirpstack-api/blob/master/protobuf/gw/gw.proto
