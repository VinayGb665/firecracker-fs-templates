#!/bin/bash
set +e


if [ ! -f deps/firecracker ]; then
    cd deps/

    git clone https://github.com/firecracker-microvm/firecracker firec
    cd firec
    tools/devtool build
    toolchain="$(uname -m)-unknown-linux-musl"
    cd ../
    cp firec/build/cargo_target/${toolchain}/debug/firecracker .
    rm -rf firec
fi

echo "== Firecracker binary loaded =="
if [ ! -f deps/firectl ]; then
    cd deps
    git clone https://github.com/firecracker-microvm/firectl firect
    cd firect
    make
    cp firectl ../
    cd ..
    rm -rf firect
fi
echo "== Firectl binary loaded =="


sudo setfacl -m u:${USER}:rw /dev/kvm
echo "== Set read/write access to kvm =="