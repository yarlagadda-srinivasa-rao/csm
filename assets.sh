#!/usr/bin/env bash

# Copyright 2021 Hewlett Packard Enterprise Development LP

PIT_ASSETS=(
    http://car.dev.cray.com/artifactory/csm/MTL/sle15_sp2_ncn/x86_64/dev/master/casmpet-team/cray-pre-install-toolkit-sle15sp2.x86_64-1.4.10-20210428013505-gab1b3b3.iso
    http://car.dev.cray.com/artifactory/csm/MTL/sle15_sp2_ncn/x86_64/dev/master/casmpet-team/cray-pre-install-toolkit-sle15sp2.x86_64-1.4.10-20210428013505-gab1b3b3.packages
    http://car.dev.cray.com/artifactory/csm/MTL/sle15_sp2_ncn/x86_64/dev/master/casmpet-team/cray-pre-install-toolkit-sle15sp2.x86_64-1.4.10-20210428013505-gab1b3b3.verified
)

KUBERNETES_ASSETS=(
    https://arti.dev.cray.com/artifactory/node-images-stable-local/shasta/kubernetes/0.1.24/kubernetes-0.1.24.squashfs
    https://arti.dev.cray.com/artifactory/node-images-stable-local/shasta/kubernetes/0.1.24/5.3.18-24.52-default-0.1.24.kernel
    https://arti.dev.cray.com/artifactory/node-images-stable-local/shasta/kubernetes/0.1.24/initrd.img-0.1.24.xz
)

STORAGE_CEPH_ASSETS=(
    https://arti.dev.cray.com/artifactory/node-images-stable-local/shasta/storage-ceph/0.1.24/storage-ceph-0.1.24.squashfs
    https://arti.dev.cray.com/artifactory/node-images-stable-local/shasta/storage-ceph/0.1.24/5.3.18-24.52-default-0.1.24.kernel
    https://arti.dev.cray.com/artifactory/node-images-stable-local/shasta/storage-ceph/0.1.24/initrd.img-0.1.24.xz
)

FIRMWARE_PACKAGE=http://car.dev.cray.com/artifactory/internal/~PVIRTUCIO/release/Cray_Firmware/03.04.2021_v1/firmware_package_03042021a.tgz

set -exo pipefail

# Verify assets exist
for url in "${PIT_ASSETS[@]}"; do curl -sfSLI "$url"; done
for url in "${KUBERNETES_ASSETS[@]}"; do curl -sfSLI "$url"; done
for url in "${STORAGE_CEPH_ASSETS[@]}"; do curl -sfSLI "$url"; done
curl -sfSLI "$FIRMWARE_PACKAGE"
