ARG BASE_IMG=debian:bullseye
# hadolint ignore=DL3006
FROM $BASE_IMG

COPY files/sources.list /etc/apt/sources.list

RUN apt-get update

# Some bootstrapping tools c.f seL4 Dockerfiles base_tools
RUN apt-get install -y --no-install-recommends \
    bc \
    ca-certificates \
    devscripts \
    expect \
    git \
    iproute2 \
    iputils-ping \
    jq \
    make \
    python \
    python3-dev \
    python3-pip \
    repo \
    ssh \
    traceroute \
    wget

# Install python dependencies - needed for build system
# Upgrade pip first, then install setuptools (required for other pip packages)
# Install some basic python tools
RUN pip3 install --no-cache-dir setuptools
RUN pip3 install --no-cache-dir \
    gitlint \
    nose \
    reuse

RUN apt-get clean autoclean && \
    apt-get autoremove --purge --yes && \
    rm -rf /var/lib/apt/lists/*
