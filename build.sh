#!usr/bin/env bash

pip3 install j2cli

if [[ ! -e sonic-buildimage ]]; then
    git clone https://github.com/sonic-net/sonic-buildimage.git
fi

cd sonic-buildimage
git submodule update --init

# copy overlays
cp -r ../overlays/x86_64-accton_as7726_32x-r0/* device/accton/x86_64-accton_as7726_32x-r0

make init
make configure PLATFORM=broadcom
make SONIC_BUILD_JOBS=4 all
