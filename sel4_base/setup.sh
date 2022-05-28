apt-get update

HOST_ARCH=$(uname -m)
ARG ADD_RISCV="yes"

apt-get install -y --no-install-recommends \
    astyle=3.1-2+b1 \
    build-essential \
    ccache \
    clang-11 \
    cmake \
    cmake-curses-gui \
    coreutils \
    cpio \
    curl \
    device-tree-compiler \
    doxygen \
    g++-10 \
    gcc-10 \
    gcc-10-base \
    libarchive-dev \
    libcc1-0 \
    libclang-11-dev \
    libncurses-dev \
    libuv1 \
    libxml2-utils \
    locales \
    ninja-build \
    protobuf-compiler \
    python3-protobuf \
    qemu-system-x86 \
    qemu-system-arm \
    qemu-system-misc \
    sloccount \
    sudo \
    u-boot-tools

pip3 install --no-cache-dir pylint sel4_deps

if [ "$ADD_RISCV" = "yes" ]; then
    apt-get install autoconf automake autotools-dev curl python3 libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev
    cd /tmp
    git clone https://github.com/riscv/riscv-gnu-toolchain
    cd riscv-gnu-toolchain
    ./configure --prefix /opt/riscv/ --enable-multilib
    make linux
    cd ..
    rm -rf riscv-gnu-toolchain
fi

apt-get install -y --no-install-recommends \
    tmux \
    emacs

apt-get clean autoclean &&
    apt-get autoremove --purge --yes &&
    rm -rf /var/lib/apt/lists/*
