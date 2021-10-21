ARG BUILD_FROM
FROM $BUILD_FROM

# Consts
ARG BUILD_DEPS="apt-utils software-properties-common gnupg ca-certificates apt-transport-https dirmngr"

# Install build dependencies
RUN apt-get update
RUN apt-get install -y ${BUILD_DEPS}

# Copy files into container
COPY build /build
COPY conf /conf
COPY scripts /scripts

# Base image doesn't use systemctl, disable it before installing packages
RUN mv /bin/systemctl /bin/systemctl.orig

# Install Chirpstack Gateway Bridge
RUN /build/prepare_chirpstack.sh
RUN apt-get install -y chirpstack-gateway-bridge
COPY conf/config.toml /etc/chirpstack-gateway-bridge/chirpstack-gateway-bridge.toml

# Cleanup
RUN apt-get remove -y ${BUILD_DEPS}
RUN mv /bin/systemctl.orig /bin/systemctl
RUN rm -rf /build

RUN chmod a+x /scripts/*.sh
CMD ["/scripts/run.sh"]
