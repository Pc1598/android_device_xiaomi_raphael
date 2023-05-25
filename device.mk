#
# Copyright (C) 2023 Paranoid Android
#
# SPDX-License-Identifier: Apache-2.0
#

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Bluetooth Properties
PRODUCT_SYSTEM_PROPERTIES += \
    persist.vendor.bt.a2dp.aac_whitelist=false \
    persist.vendor.btstack.enable.twsplus=true \
    persist.vendor.btstack.enable.twsplussho=true \
    persist.vendor.btsatck.absvolfeature=true \
    ro.bluetooth.library_name=libbluetooth_qti.so

PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.qcom.bluetooth.a2dp_offload_cap=sbc-aptx-aptxtws-aptxhd-aac-ldac-aptxadaptive \
    persist.vendor.qcom.bluetooth.aac_frm_ctl.enabled=true \
    persist.vendor.qcom.bluetooth.aac_vbr_ctl.enabled=false \
    persist.vendor.qcom.bluetooth.enable.splita2dp=true \
    persist.vendor.qcom.bluetooth.scram.enabled=true \
    persist.vendor.qcom.bluetooth.soc=cherokee \
    persist.vendor.qcom.bluetooth.twsp_state.enabled=false \
    ro.vendor.bluetooth.wipower=false \
    vendor.qcom.bluetooth.soc=cherokee

# Camera
PRODUCT_VENDOR_PROPERTIES += \
    camera.disable_zsl_mode=true

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml

PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service_64 \
    libcamera2ndk_vendor \
    libstdc++.vendor \
    vendor.qti.hardware.camera.device@1.0.vendor \
    vendor.qti.hardware.camera.postproc@1.0.vendor

# Crypto
PRODUCT_VENDOR_PROPERTIES += \
    ro.crypto.dm_default_key.options_format.version=2 \
    ro.crypto.volume.filenames_mode=aes-256-cts \
    ro.crypto.volume.metadata.method=dm-default-key \
    ro.crypto.volume.options=::v2

# DPM
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.dpm.feature=1 \
    persist.vendor.dpm.nsrm.bkg.evt=3955 \
    persist.vendor.dpmhalservice.enable=1

# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom

PRODUCT_PACKAGES += \
    fstab.qcom

# Overlays
PRODUCT_PACKAGES += \
    RaphaelFrameworks

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Platform
TARGET_BOARD_PLATFORM := msmnile

# QTI components
TARGET_COMMON_QTI_COMPONENTS := \
    bt \
    telephony

# Radio Properties
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.radio.data_ltd_sys_ind=1 \
    persist.vendor.radio.dynamic_sar=1 \
    persist.vendor.radio.force_ltd_sys_ind=1 \
    persist.vendor.radio.force_on_dc=true \
    persist.vendor.radio.manual_nw_rej_ct=1 \
    persist.vendor.radio.redir_party_num=1 \
    persist.vendor.radio.report_codec=1

PRODUCT_SYSTEM_PROPERTIES += \
    persist.radio.dynamic_sar=false \
    persist.radio.NO_STAPA=1 \
    persist.radio.VT_HYBRID_ENABLE=1 \
    ro.telephony.default_cdma_sub=0 \
    ro.telephony.default_network=22,22

# Shipping API
PRODUCT_SHIPPING_API_LEVEL := 28

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Call the proprietary setup
$(call inherit-product, vendor/xiaomi/raphael/raphael-vendor.mk)
