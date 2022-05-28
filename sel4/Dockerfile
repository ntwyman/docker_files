FROM gnu-riscv as rv-tools


FROM debian:bullseye-slim
COPY sources.list /etc/apt/sources.list
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    astyle=3.1-2+b1 \
    bc \
    build-essential \
    ca-certificates \
    ccache \
    clang-11 \
    cmake \
    cmake-curses-gui \
    coreutils \
    cpio \
    curl \
    devscripts \
    device-tree-compiler \
    doxygen \
    devscripts \
    g++ \
    g++-arm-linux-gnueabi \
    g++-arm-linux-gnueabihf \
    gcc \
    gcc-arm-linux-gnueabi \
    gcc-arm-linux-gnueabihf \
    iproute2 \
    iputils-ping \
    jq \
    libarchive-dev \
    libcc1-0 \
    libclang-11-dev \
    libncurses-dev \
    libuv1 \
    libxml2-utils \
    locales \
    make \
    ninja-build \
    protobuf-compiler \
    python \
    python3-dev \
    python3-pip \
    python3-protobuf \
    qemu-system-x86 \
    qemu-system-arm \
    qemu-system-misc \
    repo \
    sloccount \
    ssh \
    sudo \
    traceroute \
    u-boot-tools && \
    update-alternatives --install /usr/bin/python python /usr/bin/python2 10 && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3 20 && \
    pip3 install --no-cache-dir gitlint nose pylint reuse setuptools sel4_deps && \
    apt-get clean autoclean && \
    apt-get autoremove --purge --yes && \
    rm -rf /var/lib/apt/lists/*
COPY --from=rv-tools /opt/riscv/ /opt/riscv
