#!/bin/sh

sudo systemd-nspawn -bD $(dirname $0)/rootfs
