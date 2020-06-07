![CI](https://github.com/VinayGb665/firecracker-fs-templates/workflows/CI/badge.svg)
# Firecracker images/templates

Build rootfs to run different workloads on firecracker based VMs.

As last updated :
- Python2 with alpine based rootfs - 256MB rootfs
- Python3 with an ubuntu based rootfs - 1G rootfs with full python installation

## Initial Steps

This requires docker and sudo privileges

### Build dependencies
Downloads firecracker and firectl binaries.
```bash
make dependencies
```
Note: Run this as sudo cuz we need to set read/write access for kvm

### Test Python3
Hopefully the dependencies were built successfullly. Build the python3fire image responsible for rootfs creation and run the binaries. Orrr just use the damn make and eat the cake
```bash
make test-python3
```
This will spawn a VM with the ubuntu image created with the contents of tests/demo present at **/usr/local/pyrun**.

The rootfs will be available in your host machine at tests/demo/rootfs


## Future
Who tf knows. Now sleep
