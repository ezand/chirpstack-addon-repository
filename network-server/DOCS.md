# Chirpstack Network Server

![Supports aarch64 Architecture][aarch64-shield] ![Supports amd64 Architecture][amd64-shield] ![Supports armhf Architecture][armhf-shield] ![Supports armv7 Architecture][armv7-shield] ![Supports i386 Architecture][i386-shield]

his add-on provides a Chirpstack Network Server for your network.

[ChirpStack Network Server][network-server] is an open-source LoRaWAN® Network Server implementation. This component is part of the ChirpStack stack.

The responsibility of the Network Server component is the de-duplication of received LoRaWAN frames by the LoRa® gateways and for the collected frames handle the:

## Prerequisites

* A running PostgreSQL database.
  * Also [see required PostgreSQL setup][chirpstack-debian] in the `Setup PostgreSQL databases and users` section.
* A running Redis database.
* A supported integration:
  * `mqtt`: a running MQTT broker.
  * `amqp`: a running RabbitMQ broker.
  * `aws_sns`: access to an AWS Simple Notification Service (SNS).
  * `azure_service_bus`: access to an Azure Service-Bus service.
  * `gcp_pub_sub`: access to a Google Cloud Pub/Sub service.
  * `kafka`: access to a Kafka distributed streaming platform.
  * `postgres`: a running PostgreSQL database.

## Authentication

* LoRaWAN mac-layer (and mac-commands)
* Communication with the ChirpStack [Application Server][application-server]
* Scheduling of downlink frames

## Configuration

Refer to the [Chirpstack documentation][network-server-config] for configuration details.

| Key | Default | Note |
:--- | :-- | :--- |
| `log_level` | `4` | |
| `log_to_syslog` | `false` | |
| `grpc_default_resolver_scheme` | `passthrough` | |
| `postgresql.dsn` | `postgres://localhost/chirpstack_ns?sslmode=disable` | |
| `postgresql.automigrate` | `true` | |
| `postgresql.max_open_connections` | `0` | |
| `postgresql.max_idle_connections` | `2` | |
| `redis.servers` | `localhost:6379` | Comma separated string. |
| `redis.password` | `<empty string>` | |
| `redis.database` | `0` | |
| `redis.cluster` | `false` | |
| `redis.master_name` | `<empty string>` | |
| `redis.pool_size` | `0` | |
| `redis.tls_enabled` | `false` | |
| `redis.key_prefix` | `<empty string>` | |
| `net_id` | `000000` | |
| `deduplication_delay` | `200ms` | |
| `device_session_ttl` | `744h0m0s` | |
| `get_downlink_data_delay` | `100ms` | |
| `band.name` | `EU868` | |
| `band.uplink_dwell_time_400ms` | `false` | |
| `band.downlink_dwell_time_400ms` | `false` | |
| `band.uplink_max_eirp` | `-1` | |
| `band.repeater_compatible` | `false` | |
| `network.installation_margin` | `10` | |
| `network.rx_window` | `0` | |
| `network.rx1_dr_offset` | `0` | |
| `network.rx2_dr` | `-1` | |
| `network.rx2_frequency` | `-1` | |
| `network.rx2_prefer_on_rx1_dr_lt` | `0` | |
| `network.rx2_prefer_on_link_budget` | `false` | |
| `network.gateway_prefer_min_margin` | `10` | |
| `network.downlink_tx_power` | `-1` | |
| `network.disable_mac_commands` | `false` | |
| `network.disable_adr` | `false` | |
| `network.max_mac_command_error_count` | `3` | |
| `network.enabled_uplink_channels` | `<empty string>` | |
| `network.adr_plugins` | `<empty string>` | |
| `network_class_b.ping_slot_dr` | `0` | |
| `network_class_b.ping_slot_frequency` | `0` | |
| `network_rejoin.enabled` | `false` | |
| `network_rejoin.max_count_n` | `0` | |
| `network_rejoin.max_time_n` | `0` | |
| `scheduler.interval` | `1s` | |
| `scheduler_class_c.device_downlink_lock_duration` | `2s` | |
| `scheduler_class_c.gateway_downlink_lock_duration` | `0s` | |
| `scheduler_class_c.multicast_gateway_delay` | `2s` | |
| `api.bind` | `0.0.0.0:8000` | |
| `gateway.force_gws_private` | `false` | |
| `gateway.downlink_timeout` | `1s` | |
| `gateway.backend` | `mqtt` | |
| `gateway.multi_downlink_feature` | `hybrid` | |
| `mqtt.event_topic` | `gateway/+/event/+` | |
| `mqtt.command_topic_template` | `gateway/{{ .GatewayID }}/command/{{ .CommandType }}` | |
| `mqtt.server` | `tcp://localhost:1883` | |
| `mqtt.username` | `<empty string>` | |
| `mqtt.password` | `<empty string>` | |
| `mqtt.max_reconnect_interval` | `1m0s` | |
| `mqtt.qos` | `0` | |
| `mqtt.clean_session` | `true` | |
| `mqtt.client_id` | `cns_ha_addon` | |
| `amqp.url` | `amqp://guest:guest@localhost:5672` | |
| `amqp.event_queue_name` | `gateway-events` | |
| `amqp.event_routing_key` | `gateway.*.event.*` | |
| `amqp.command_routing_key_template` | `gateway.{{ .GatewayID }}.command.{{ .CommandType }}` | |
| `gcp_pub_sub.credentials_file` | `<empty string>` | |
| `gcp_pub_sub.project_id` | `<empty string>` | |
| `gcp_pub_sub.uplink_topic_name` | `<empty string>` | |
| `gcp_pub_sub.downlink_topic_name` | `<empty string>` | |
| `gcp_pub_sub.uplink_retention_duration` | `24h0m0s` | |
| `azure_iot_hub.events_connection_string` | `<empty string>` | |
| `azure_iot_hub.commands_connection_string` | `<empty string>` | |
| `monitoring.bind` | `<empty string>` | |
| `monitoring.healthcheck_endpoint` | `false` | |
| `monitoring.device_frame_log_max_history` | `0` | |
| `monitoring.per_device_frame_log_max_history` | `10` | |
| `monitoring.gateway_frame_log_max_history` | `0` | |
| `monitoring.per_gateway_frame_log_max_history` | `10` | |
| `prometheus.enabled` | `false` | |
| `prometheus.api_timing_histogram` | `false` | |
| `join_server.resolve_join_eui` | `false` | |
| `join_server.resolve_domain_suffix` | `.joineuis.lora-alliance.org` | |
| `default_join_server.server` | `http://localhost:8003` | |
| `network_controller.server` | `<empty string>` | |
| `roaming.resolve_netid_domain_suffix` | `.netids.lora-alliance.org` | |
| `roaming.bind` | `<empty string>` | |
| `default_roaming.enabled` | `false` | |
| `default_roaming.server` | `<empty string>` | |
| `default_roaming.async` | `false` | |
| `default_roaming.async_timeout` | `0s` | |
| `default_roaming.passive_roaming` | `false` | |
| `default_roaming.passive_roaming_lifetime` | `0s` | |
| `default_roaming.passive_roaming_kek_label` | `<empty string>` | |
| `default_roaming.authorization` | `<empty string>` | |

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[network-server]: https://www.chirpstack.io/network-server/
[network-server-config]: https://www.chirpstack.io/network-server/install/config/
[application-server]: https://www.chirpstack.io/application-server/
[common-data-format]: https://github.com/brocaar/chirpstack-api/blob/master/protobuf/gw/gw.proto
[chirpstack-debian]: https://www.chirpstack.io/project/guides/debian-ubuntu/
