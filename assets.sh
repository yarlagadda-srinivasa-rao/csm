#!/usr/bin/env bash

# Copyright 2021 Hewlett Packard Enterprise Development LP

PIT_ASSETS=(
    https://arti.dev.cray.com/artifactory/csm-distribution-stable-local/cray-pre-install-toolkit/1.4.9/cray-pre-install-toolkit-sle15sp2.x86_64-1.4.9-20210309034439-g1e67449.iso
    https://arti.dev.cray.com/artifactory/csm-distribution-stable-local/cray-pre-install-toolkit/1.4.9/cray-pre-install-toolkit-sle15sp2.x86_64-1.4.9-20210309034439-g1e67449.packages
    https://arti.dev.cray.com/artifactory/csm-distribution-stable-local/cray-pre-install-toolkit/1.4.9/cray-pre-install-toolkit-sle15sp2.x86_64-1.4.9-20210309034439-g1e67449.verified
)

KUBERNETES_ASSETS=(
    https://artifactory.algol60.net/artifactory/csm-node-images/kubernetes/0.0.56/kubernetes-0.0.56.squashfs
    https://artifactory.algol60.net/artifactory/csm-node-images/kubernetes/0.0.56/5.3.18-24.75-default-0.0.56.kernel
    https://artifactory.algol60.net/artifactory/csm-node-images/kubernetes/0.0.56/initrd.img-0.0.56.xz
)

STORAGE_CEPH_ASSETS=(
    https://artifactory.algol60.net/artifactory/csm-node-images/storage-ceph/0.0.46/storage-ceph-0.0.46.squashfs
    https://artifactory.algol60.net/artifactory/csm-node-images/storage-ceph/0.0.46/5.3.18-24.75-default-0.0.46.kernel
    https://artifactory.algol60.net/artifactory/csm-node-images/storage-ceph/0.0.46/initrd.img-0.0.46.xz
)

FIRMWARE_PACKAGE=http://car.dev.cray.com/artifactory/internal/~PVIRTUCIO/release/Cray_Firmware/03.04.2021_v1/firmware_package_03042021a.tgz

FIRMWARE_ASSETS=(
    http://car.dev.cray.com/artifactory/list/integration-firmware/aruba/ArubaOS-CX_8320_10_06_0110.stable.swi
    http://car.dev.cray.com/artifactory/list/integration-firmware/aruba/ArubaOS-CX_8360_10_06_0110.stable.swi
)

set -exo pipefail

# Verify assets exist
for url in "${PIT_ASSETS[@]}"; do curl -sfSLI "$url"; done
for url in "${KUBERNETES_ASSETS[@]}"; do curl -sfSLI "$url"; done
for url in "${STORAGE_CEPH_ASSETS[@]}"; do curl -sfSLI "$url"; done
curl -sfSLI "$FIRMWARE_PACKAGE"
for url in "${FIRMWARE_ASSETS[@]}"; do curl -sfSLI "$url"; done
