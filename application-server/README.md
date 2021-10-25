# Home Assistant Add-on: Chirpstack Application Server

![Supports aarch64 Architecture][aarch64-shield] ![Supports amd64 Architecture][amd64-shield] ![Supports armhf Architecture][armhf-shield] ![Supports armv7 Architecture][armv7-shield] ![Supports i386 Architecture][i386-shield]

This add-on provides a Chirpstack Application Server for your network.

[ChirpStack Application Server][application-server] is an open-source LoRaWAN® Application Server, part of the ChirpStack open-source LoRaWAN Network Server stack. It is responsible for the device "inventory" part of a LoRaWAN infrastructure, handling of join-request and the handling and encryption of application payloads.

It offers a [web-interface][application-server-web] where users, organizations, applications and devices can be managed. For integration with external services, it offers a [gRPC and RESTful API][application-server-api].

Device data can be [sent and / or received][application-server-events] over MQTT, HTTP and be written directly into InfluxDB.

See also the complete list of ChirpStack Application Server [features][application-server-features].

## Prerequisites

* A running PostgreSQL database.
  * Also [see required PostgreSQL setup][chirpstack-debian] in the `Setup PostgreSQL databases and users` section.
* A running Redis database.
* A supported gateway backend:
  * `mqtt`: a running MQTT broker.
  * `amqp`: a running RabbitMQ broker.
  * `gcp_pub_sub`: access to a Google Cloud IoT Core MQTT broker.
  * `azure_iot_hub`: access to an Azure IoT Hub MQTT broker.

## Configuration

Refer to the [Chirpstack documentation][application-server-config] for configuration details.

| Key | Default | Note |
:--- | :-- | :--- |
| `log_level` | `4` | |
| `log_to_syslog` | `false` | |
| `password_hash_iterations` | `100000` | |
| `grpc_default_resolver_scheme` | `passthrough` | |
| `postgresql.dsn` | `postgres://localhost/chirpstack_as?sslmode=disable` | |
| `postgresql.automigrate` | `true` | |
| `postgresql.max_open_connections` | `0` | |
| `postgresql.max_idle_connections` | `2` | |
| `redis.servers` | `localhost:6379` | Comma-separated string. |
| `redis.password` | `<empty string>` | |
| `redis.database` | `0` | |
| `redis.cluster` | `false` | |
| `redis.master_name` | `<empty string>` | |
| `redis.pool_size` | `0` | |
| `redis.tls_enabled` | `false` | |
| `redis.key_prefix` | `<empty string>` | |
| `id` | `<random generated string>` | |
| `openid_connect.enabled` | `false` | |
| `openid_connect.registration_enabled` | `false` | |
| `openid_connect.registration_callback_url` | `<empty string>` | |
| `openid_connect.provider_url` | `<empty string>` | |
| `openid_connect.client_id` | `<empty string>` | |
| `openid_connect.client_secret` | `<empty string>` | |
| `openid_connect.redirect_url` | `<empty string>` | |
| `openid_connect.logout_url` | `<empty string>` | |
| `openid_connect.login_label` | `<empty string>` | |
| `codec_js.max_execution_time` | `100ms` | |
| `integration.marshaler` | `json_v3` | |
| `integration.enabled` | `<empty string>` | |
| `mqtt.event_topic_template` | `application/{{ .ApplicationID }}/device/{{ .DevEUI }}/event/{{ .EventType }}` | |
| `mqtt.command_topic_template` | `application/{{ .ApplicationID }}/device/{{ .DevEUI }}/command/{{ .CommandType }}` | |
| `mqtt.retain_events` | `false` | |
| `mqtt.server` | `tcp://localhost:1883` | |
| `mqtt.username` | `<empty string>` | |
| `mqtt.password` | `<empty string>` | |
| `mqtt.max_reconnect_interval` | `1m0s` | |
| `mqtt.qos` | `0` | |
| `mqtt.clean_session` | `true` | |
| `mqtt.client_id` | `cas_ha_addon` | |
| `amqp.url` | `amqp://guest:guest@localhost:5672` | |
| `amqp.event_routing_key_template` | `application.{{ .ApplicationID }}.device.{{ .DevEUI }}.event.{{ .EventType }}` | |
| `aws_sns.aws_region` | `<empty string>` | |
| `aws_sns.aws_access_key_id` | `<empty string>` | |
| `aws_sns.aws_secret_access_key` | `<empty string>` | |
| `aws_sns.topic_arn` | `<empty string>` | |
| `azure_service_bus.connection_string` | `<empty string>` | |
| `azure_service_bus.publish_mode` | `<empty string>` | |
| `azure_service_bus.publish_name` | `<empty string>` | |
| `gcp_pub_sub.project_id` | `<empty string>` | |
| `gcp_pub_sub.topic_name` | `<empty string>` | |
| `kafka.brokers` | `localhost:9092` | Comma-separated string. |
| `kafka.tls` | `false` | |
| `kafka.topic` | `chirpstack_as` | |
| `kafka.event_key_template` | `application.{{ .ApplicationID }}.device.{{ .DevEUI }}.event.{{ .EventType }}` | |
| `kafka.username` | `<empty string>` | |
| `kafka.password` | `<empty string>` | |
| `kafka.mechanism` | `plain` | |
| `kafka.algorithm` | `SHA-512` | |
| `postgresql.dsn` | `<empty string>` | |
| `postgresql.max_open_connections` | `0` | |
| `postgresql.max_idle_connections` | `2` | |
| `internal_api.bind` | `0.0.0.0:8001` | |
| `internal_api.public_host` | `localhost:8001` | |
| `external_api.bind` | `0.0.0.0:8080` | |
| `external_api.jwt_secret` | `<empty string>` | |
| `external_api.cors_allow_origin` | `<empty string>` | |
| `join_server.bind` | `0.0.0.0:8003` | |
| `join_server_kek.as_kek_label` | `<empty string>` | |
| `metrics.timezone` | `Local` | |
| `metrics_redis.aggregation_intervals` | `MINUTE,HOUR,DAY,MONTH` | Comma-separated string. |
| `metrics_redis.minute_aggregation_ttl` | `2h0m0s` | |
| `metrics_redis.hour_aggregation_ttl` | `48h0m0s` | |
| `metrics_redis.day_aggregation_ttl` | `2160h0m0s` | |
| `metrics_redis.month_aggregation_ttl` | `17520h0m0s` | |
| `monitoring.bind` | `<empty string>` | |
| `monitoring.prometheus_endpoint` | `false` | |
| `monitoring.prometheus_api_timing_histogram` | `false` | |
| `monitoring.healthcheck_endpoint` | `false` | |
| `monitoring.per_device_event_log_max_history` | `10` | |
| `prometheus.enabled` | `false` | |
| `prometheus.bind` | `<empty string>` | |
| `prometheus.api_timing_histogram` | `false` | |

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[application-server]: https://www.chirpstack.io/application-server/
[application-server-features]: https://www.chirpstack.io/application-server/features/
[application-server-events]: https://www.chirpstack.io/application-server/integrations/events/
[application-server-api]: https://www.chirpstack.io/application-server/api/
[application-server-web]: https://www.chirpstack.io/application-server/use/login/
[application-server-config]: https://www.chirpstack.io/application-server/install/config/
[chirpstack-debian]: https://www.chirpstack.io/project/guides/debian-ubuntu/0
