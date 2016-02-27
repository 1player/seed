#!/bin/bash

BASE=$(dirname $0)
ROOTFS=$BASE/rootfs

# Clear existing rootfs
rm -rf $ROOTFS/

# Create rootfs
mkdir -p $ROOTFS/etc/ $ROOTFS/root/ $ROOTFS/bin
ln -s bin $ROOTFS/sbin
echo 'NAME="seed"' > $ROOTFS/etc/os-release
echo 'root::0:0:root:/root:/bin/sh' > $ROOTFS/etc/passwd
echo 'console::respawn:/bin/getty 38400 /dev/console' > $ROOTFS/etc/inittab

# Copy busybox
cp ./busybox $ROOTFS/bin/busybox
pushd $ROOTFS/bin
for cmd in $(./busybox --list)
do
    ln -s busybox $cmd
done
popd
