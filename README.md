# seed

Build a minimal Busybox container.

## Requirements

* systemd-nspawn

## Create the container

    ./build.sh

The container will be created in `./rootfs/`

## Spawn the container

    ./enter.sh

`systemd-nspawn` will enter the container. Login with root.
