ARG BUILD_FROM
FROM $BUILD_FROM

# Consts
ARG BUILD_DEPS="apt-utils software-properties-common gnupg ca-certificates apt-transport-https dirmngr"
ARG SERVICE="chirpstack-network-server"

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
RUN apt-get install -y ${SERVICE}
COPY conf/config.toml /etc/${SERVICE}/${SERVICE}.toml

# Cleanup
RUN apt-get remove -y ${BUILD_DEPS}
RUN mv /bin/systemctl.orig /bin/systemctl
RUN rm -rf /build

RUN chmod a+x /scripts/*.sh
CMD ["/scripts/run.sh"]
