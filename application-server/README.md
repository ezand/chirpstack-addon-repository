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

| Key | Mandatory | Default value | Description |
:--- | :-- | :-- | :--- |

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
