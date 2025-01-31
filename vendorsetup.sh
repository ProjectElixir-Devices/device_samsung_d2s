#!/bin/bash

echo 'Starting Cloning repos for d2s'
echo 'Cloning Kernel tree [1/7]'
# Kernel for exynos9820
rm -rf kernel/samsung/exynos9820
git clone --depth=1 https://github.com/Infinity-X-Project/android_kernel_samsung_exynos9820 -b lineage-22.0 kernel/samsung/exynos9820

echo 'Cloning Common Tree [2/7]'
# Common tree for exynos9820-common
rm -rf device/samsung/exynos9820-common
git clone https://github.com/ProjectElixir-Devices/android_device_samsung_exynos9820-common -b ELIXIR-15 device/samsung/exynos9820-common

echo 'Cloning Device Tree [3/7]'
# Device tree for d2s
rm -rf device/samsung/d2s
git clone https://github.com/ProjectElixir-Devices/android_device_samsung_d2s device/samsung/d2s

echo 'Cloning Vendor Trees [4/7]'
# Vendor blobs for d2s
rm -rf vendor/samsung/d2s
git clone https://github.com/linux4-bringup-priv/android_vendor_samsung_d2s -b lineage-22.0 vendor/samsung/d2s
rm -rf vendor/samsung/exynos9820-common
git clone https://github.com/linux4-bringup-priv/android_vendor_samsung_exynos9820-common -b lineage-22.0 vendor/samsung/exynos9820-common

echo 'Cloning Hardware Samsung [5/7]'
# Hardware OSS parts for Samsung
mv hardware/samsung/nfc .
rm -rf hardware/samsung
git clone -b lineage-22.0 https://github.com/BananaDroid-982x/android_hardware_samsung hardware/samsung
mv nfc hardware/samsung

echo 'Cloning Samsung_Slsi and Linaro BSP repos [6/7]'
# SLSI Sepolicy
rm -rf device/samsung_slsi/sepolicy
git clone -b lineage-22.0 https://github.com/BananaDroid-982x/android_device_samsung_slsi_sepolicy device/samsung_slsi/sepolicy
# Linaro BSP
rm -rf hardware/samsung_slsi-linaro
git clone https://github.com/linux4-bringup-priv/android_hardware_samsung_slsi-linaro_graphics.git -b lineage-22.0 hardware/samsung_slsi-linaro/graphics
git clone https://github.com/linux4-bringup-priv/android_hardware_samsung_slsi-linaro_config.git -b lineage-22.0 hardware/samsung_slsi-linaro/config
git clone https://github.com/linux4-bringup-priv/android_hardware_samsung_slsi-linaro_exynos.git -b lineage-22.0 hardware/samsung_slsi-linaro/exynos
git clone https://github.com/linux4-bringup-priv/android_hardware_samsung_slsi-linaro_openmax.git -b lineage-22.0 hardware/samsung_slsi-linaro/openmax
git clone https://github.com/linux4-bringup-priv/android_hardware_samsung_slsi-linaro_exynos5.git -b lineage-22.0 hardware/samsung_slsi-linaro/exynos5
git clone https://github.com/linux4-bringup-priv/android_hardware_samsung_slsi-linaro_interfaces.git -b lineage-22.0 hardware/samsung_slsi-linaro/interfaces

echo 'Cloning Sepolicy Dependency repo [7/7]'
# Sepolicy
rm -rf device/aosp/sepolicy
git clone https://github.com/crdroidandroid/android_device_crdroid_sepolicy -b 15.0 device/aosp/sepolicy
