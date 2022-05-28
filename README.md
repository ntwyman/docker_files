# skourios_docker

Docker files to build images for working with skourios (Rust on seL4). Currently set up to build images 
for an Aarch64 container (am running on M1 Mac).


## gnu-riscv

This image is not used for development. It builds the [GNU riscv gcc toolchain](https://github.com/riscv-collab/riscv-gnu-toolchain). Leaves tools in `/opt/riscv/`.

Might be better to build to a mountable volume... currently just copy directly from this image.

## sel4

This builds an image FROM `debian:bullseye-slim`, based on the [seL4-CAmkES-L4v](https://github.com/seL4/seL4-CAmkES-L4v-dockerfiles) docker files from the folks at [Trustworthy Systems](https://trustworthy.systems)[^1].

This currently installs all the requirements from `base_tools` and `sel4` necessary to build `sel4` kernels for `arm`, `aarch64`, `riscv32` and `riscv64` systems.

I use [sel4test](https://docs.sel4.systems/projects/sel4test/) to verify that everything needed is installed.

The `sel4` image does all package/tool installation from the `root` account and leaves adding working accounts up to consumers of the image. It is not intended to be used directly but as a base image upon which I build dev environments.


[^1]: I guess I could have tried to update the seL4-CAmkES-L4v files directly but they seemed to have some assumptions about an x86 family host (particularly with x-compilation toolchain names). After a while I ended up deciding I was spending too much time wrestling with this and too little actually trying to write rust code on seL4. I may come back to this at a future date.
