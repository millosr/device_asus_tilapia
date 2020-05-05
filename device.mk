#
# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# rild
PRODUCT_PACKAGES += \
    rild \
    BasicSmsReceiver \
    libstlport

PRODUCT_COPY_FILES := \
    device/asus/tilapia/fstab.grouper:root/fstab.grouper \
    device/asus/tilapia/init.tilapia.rc:root/init.grouper.rc

# Allow tethering without provisioning app
PRODUCT_PROPERTY_OVERRIDES += \
    net.tethering.noprovisioning=true

# the actual meat of the device-specific product definition
$(call inherit-product, device/asus/grouper/device-common.mk)

DEVICE_PACKAGE_OVERLAYS := \
    device/asus/tilapia/overlay

VENDOR_FOLDER := vendor/asus/tilapia
PRODUCT_COPY_FILES += \
	$(VENDOR_FOLDER)/proprietary/vendor/lib/libxgold-ril.so:system/lib/libxgold-ril.so \
	$(VENDOR_FOLDER)/proprietary/etc/apns-conf.xml:system/etc/apns-conf.xml

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.version.updater=nAOSProm-7.1.2-tilapia-b$(ROM_BUILD_NUM) \
    persist.rom.updater.uri=https://dl.dropboxusercontent.com/s/3zqhkta4buryrmo/updates-nAOSP-7.1.2-tilapia.json?dl=0

