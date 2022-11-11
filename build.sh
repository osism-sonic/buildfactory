#!/usr/bin/env bash

if [[ ! -e sonic-buildimage ]]; then
    git clone https://github.com/sonic-net/sonic-buildimage.git
fi

cd sonic-buildimage
git submodule update --init

# copy overlays
cp -r ../overlays/x86_64-accton_as7726_32x-r0/* device/accton/x86_64-accton_as7726_32x-r0

make init

# https://github.com/sonic-net/sonic-buildimage/blob/master/rules/config
make configure \
    PLATFORM=broadcom \
    INCLUDE_ICCPD=y \
    INCLUDE_KUBERNETES=y \
    INCLUDE_RESTAPI=y \
    SONIC_BUILD_JOBS=4 \
    SONIC_CONFIG_USE_NATIVE_DOCKERD_FOR_BUILD=y \
    SONIC_DPKG_CACHE_METHOD=rwcache \
    SONIC_USE_DOCKER_BUILDKIT=y

BLDENV=stretch make stretch
make target/sonic-broadcom.bin
