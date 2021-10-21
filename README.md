# Chirpstack Add-On Repository

This is a Home Assistant Add-On repository for [Chirpstack][chirpstack] services.

## Gateway Bridge

This add-on provides a Chirpstack Gateway Bridge for your network.

[ChirpStack Gateway Bridge][gateway-bridge] is a service which converts LoRa® Packet Forwarder protocols into a ChirpStack Network Server [common data-format][common-data-format] (JSON and Protobuf). This component is part of the ChirpStack open-source LoRaWAN® Network Server stack.

## Network Server

This add-on provides a Chirpstack Network Server for your network.

[ChirpStack Network Server][network-server] is an open-source LoRaWAN® Network Server implementation. This component is part of the ChirpStack stack.

The responsibility of the Network Server component is the de-duplication of received LoRaWAN frames by the LoRa® gateways and for the collected frames handle the:

### Authentication

* LoRaWAN mac-layer (and mac-commands)
* Communication with the ChirpStack [Application Server][application-server]
* Scheduling of downlink frames

## Application Server

[ChirpStack Application Server][application-server] is an open-source LoRaWAN® Application Server, part of the ChirpStack open-source LoRaWAN Network Server stack. It is responsible for the device "inventory" part of a LoRaWAN infrastructure, handling of join-request and the handling and encryption of application payloads.

It offers a [web-interface][application-server-web] where users, organizations, applications and devices can be managed. For integration with external services, it offers a [gRPC and RESTful API][application-server-api].

Device data can be [sent and / or received][application-server-events] over MQTT, HTTP and be written directly into InfluxDB.

See also the complete list of ChirpStack Application Server [features][application-server-features].

[chirpstack]: https://www.chirpstack.io/
[gateway-bridge]: https://www.chirpstack.io/gateway-bridge/
[network-server]: https://www.chirpstack.io/network-server/
[application-server]: https://www.chirpstack.io/application-server/
[application-server-features]: https://www.chirpstack.io/application-server/features/
[application-server-events]: https://www.chirpstack.io/application-server/integrations/events/
[application-server-api]: https://www.chirpstack.io/application-server/api/
[application-server-web]: https://www.chirpstack.io/application-server/use/login/
[common-data-format]: https://github.com/brocaar/chirpstack-api/blob/master/protobuf/gw/gw.proto