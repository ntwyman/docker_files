ARG BASE_IMG=debian:bullseye-slim
# hadolint ignore=DL3006
FROM $BASE_IMG

COPY sources.list /etc/apt/sources.list

RUN apt-get update && \
    apt-get install  -y --no-install-recommends \
    autoconf \
    automake \
    autotools-dev \
    ca-certificates \
    curl \
    git \
    python3 \
    libmpc-dev \
    libmpfr-dev \
    libgmp-dev \
    gawk \
    build-essential \
    bison \
    flex \
    texinfo \
    gperf \
    libtool \
    patchutils \
    bc \
    zlib1g-dev \
    libexpat-dev

RUN git clone https://github.com/riscv/riscv-gnu-toolchain /tmp/riscv-gnu-toolchain

RUN cd /tmp/riscv-gnu-toolchain && \
    ./configure --prefix /opt/riscv/ --enable-multilib && \
    make linux && \
    cd && \
    rm -rf /tmp/riscv-gnu-toolchain

RUN apt-get clean autoclean && \
    apt-get autoremove --purge --yes && \
    rm -rf /var/lib/apt/lists/*