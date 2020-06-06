#!/bin/bash

## Mount code 
DEMOPATH=$(readlink -f tests/demo)

## Run the build image
docker run --rm --privileged -v $DEMOPATH:/opt/code python3fire

## Define firecracker & firectl binary paths, kernel opts, rootfs path and other args for firecracker
FCPATH=$(readlink -f deps/firecracker)
FCTLPATH=$(readlink -f deps/firectl)
KERNEL_OPTS="console=ttyS0 noapic reboot=k panic=1 pci=off nomodules rw"

ROOTFS=$DEMOPATH/rootfs
KERNELPATH=$DEMOPATH/hello-vmlinux.bin

if [ ! -f tests/demo/hello-vmlinux.bin ]; then
    wget https://s3.amazonaws.com/spec.ccfc.min/img/hello/kernel/hello-vmlinux.bin -O tests/demo/hello-vmlinux.bin
fi

sudo $FCTLPATH  --firecracker-binary=$FCPATH \
--kernel=$KERNELPATH --root-drive=$ROOTFS \
--kernel-opts=$KERNEL_OPTS

# sudo ./firectl --firecracker-binary=/home/vinay/SIDE_HOE/wankerrank/firecracker \
# --kernel=./hello-vmlinux.bin --root-drive=$ROOTFS\
# --kernel-opts=$KERNEL_OPTS
