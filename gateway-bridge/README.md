# Home Assistant Add-on: Chirpstack Gateway Bridge

![Supports aarch64 Architecture][aarch64-shield] ![Supports amd64 Architecture][amd64-shield] ![Supports armhf Architecture][armhf-shield] ![Supports armv7 Architecture][armv7-shield] ![Supports i386 Architecture][i386-shield]

This add-on provides a Chirpstack Gateway Bridge for your network. The Gateway Bridge may also be installed [directly on the gateway][gateway-bridge-gateway] instead of using this add-on. Be sure to check out the [deployment strategies][gateway-bridge-deployment] before you consider that option.

[ChirpStack Gateway Bridge][gateway-bridge] is a service which converts LoRa® Packet Forwarder protocols into a ChirpStack Network Server [common data-format][common-data-format] (JSON and Protobuf). This component is part of the ChirpStack open-source LoRaWAN® Network Server stack.

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[gateway-bridge]: https://www.chirpstack.io/gateway-bridge/
[gateway-bridge-gateway]: https://www.chirpstack.io/gateway-bridge/gateway/
[gateway-bridge-deployment]: https://www.chirpstack.io/gateway-bridge/install/deployment/
[common-data-format]: https://github.com/brocaar/chirpstack-api/blob/master/protobuf/gw/gw.proto
