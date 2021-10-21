# Home Assistant Add-on: Chirpstack Network Server

![Supports aarch64 Architecture][aarch64-shield] ![Supports amd64 Architecture][amd64-shield] ![Supports armhf Architecture][armhf-shield] ![Supports armv7 Architecture][armv7-shield] ![Supports i386 Architecture][i386-shield]

his add-on provides a Chirpstack Network Server for your network.

[ChirpStack Network Server][network-server] is an open-source LoRaWAN® Network Server implementation. This component is part of the ChirpStack stack.

The responsibility of the Network Server component is the de-duplication of received LoRaWAN frames by the LoRa® gateways and for the collected frames handle the:

## Authentication

* LoRaWAN mac-layer (and mac-commands)
* Communication with the ChirpStack [Application Server][application-server]
* Scheduling of downlink frames

## Configuration

Refer to the [Chirpstack documentation][network-server-config] for configuration details.

| Key | Mandatory | Default value | Description |
| --- | --- | --- | ---- |

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[network-server]: https://www.chirpstack.io/network-server/
[network-server-config]: https://www.chirpstack.io/network-server/install/config/
[application-server]: https://www.chirpstack.io/application-server/
[common-data-format]: https://github.com/brocaar/chirpstack-api/blob/master/protobuf/gw/gw.proto
