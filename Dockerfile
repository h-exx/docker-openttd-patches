FROM ghcr.io/linuxserver/baseimage-kasmvnc:debianbookworm

# set version label
ARG OPENTTD_PATCHES_VERSION="0.65.4"
ARG OPENGFX_VERSION="7.1"

RUN apt-get update -y && \
    echo "**** install Open TTD Patches ****" && \
    DEBIAN_FRONTEND=noninteractive && \
    apt-get install -y --no-install-recommends dumb-init wget unzip ca-certificates xz-utils

RUN  wget -q -O /tmp/openttd.tar.xz https://github.com/JGRennison/OpenTTD-patches/releases/download/jgrpp-${OPENTTD_PATCHES_VERSION}/openttd-jgrpp-${OPENTTD_PATCHES_VERSION}-linux-generic-amd64.tar.xz

RUN mkdir -p /usr/share/games/ && \
    tar -xvf /tmp/openttd.tar.xz -C /usr/share/games/ && \
    mv /usr/share/games/openttd* /usr/share/games/openttd && \
    rm /tmp/openttd.tar.xz && \
    rm -rf /var/lib/apt/lists

RUN wget -q -O /tmp/opengfx-${OPENGFX_VERSION}.zip  https://cdn.openttd.org/opengfx-releases/${OPENGFX_VERSION}/opengfx-${OPENGFX_VERSION}-all.zip && \
    unzip /tmp/opengfx-${OPENGFX_VERSION}.zip -d /tmp && \
    cd /usr/share/games/openttd/baseset/ && \
    tar -xf /tmp/opengfx-${OPENGFX_VERSION}.tar && \
    rm -rf /tmp/opengfx-*.tar /tmp/opengfx-*.zip

# add local files
COPY /root /

# ports and volumes
EXPOSE 3000

LABEL org.opencontainers.image.source=https://github.com/h-exx/docker-openttd-patches
LABEL org.opencontainers.image.description="OpenTTD Patches"
LABEL org.opencontainers.image.licenses=Apache-2.0

VOLUME /config
