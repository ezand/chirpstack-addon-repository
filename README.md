# Chirpstack Add-On Repository

This is a [Home Assistant][home-assistant] Add-On repository for [Chirpstack][chirpstack] services.

## Gateway Bridge

This add-on provides a Chirpstack [Gateway Bridge][gateway-bridge] for your network.

## Network Server

This add-on provides a Chirpstack [Network Server][network-server] for your network.

## Application Server

This add-on provides a Chirpstack [Application Server][application-server] for your network.

[home-assistant]: https://www.home-assistant.io/
[chirpstack]: https://www.chirpstack.io/
[gateway-bridge]: https://www.chirpstack.io/gateway-bridge/
[network-server]: https://www.chirpstack.io/network-server/
[application-server]: https://www.chirpstack.io/application-server/

## Development

```bash
# Start local PostgreSQL, Mosquitto and Redis
$ docker-compose up -d

# Initiate Chirpstack tables and roles (first time after container is created.)
$ .dev/sql/init_chirpstack.sh
```
