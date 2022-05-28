tee /etc/apt/sources.list <<EOF
deb http://deb.debian.org/debian bullseye main contrib
deb http://security.debian.org/debian-security bullseye-security main contrib
deb http://deb.debian.org/debian bullseye-updates main contrib
EOF
apt-get update

# Some bootstrapping tools c.f seL4 Dockerfiles base_tools
apt-get install -y --no-install-recommends \
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
pip3 install --no-cache-dir setuptools
pip3 install --no-cache-dir \
    gitlint \
    nose \
    reuse

apt-get clean autoclean &&
    apt-get autoremove --purge --yes &&
    rm -rf /var/lib/apt/lists/*
