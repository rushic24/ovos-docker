FROM debian:bookworm-slim AS build

ARG BRANCH

RUN apt-get update \
    && apt-get install -y git cmake gcc g++ build-essential \
    && git clone https://github.com/OpenVoiceOS/ovos-bus-server.git -b $BRANCH /usr/src/ovos-bus-server

WORKDIR /usr/src/ovos-bus-server/server

RUN cmake . \
    && make

FROM debian:bookworm-slim

ARG BUILD_DATE=unknown
ARG VERSION=unknown

LABEL org.opencontainers.image.title="Open Voice OS OCI message bus, C++ implementation"
LABEL org.opencontainers.image.description="Alternative C++ messagebus server implementation for ovos-core using the WebSocket++ WebSocket library"
LABEL org.opencontainers.image.version=${VERSION}
LABEL org.opencontainers.image.created=${BUILD_DATE}
LABEL org.opencontainers.image.documentation="https://openvoiceos.github.io/community-docs"
LABEL org.opencontainers.image.source="https://github.com/OpenVoiceOS/ovos-docker"
LABEL org.opencontainers.image.vendor="Open Voice OS"

ARG USER=ovos

COPY --from=build /usr/src/ovos-bus-server/server/ovos-bus-server /usr/local/bin/

RUN useradd --no-log-init $USER -m -c "Open Voice OS user"

USER $USER

ENTRYPOINT ovos-bus-server