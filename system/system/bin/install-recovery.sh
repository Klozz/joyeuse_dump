#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:134217728:0d4f78a1628615f9e870579ba85b7f76a3bf8882; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:134217728:86387d50992e1bf6c59f67a898b03e2c44ad8ba2 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:134217728:0d4f78a1628615f9e870579ba85b7f76a3bf8882 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
