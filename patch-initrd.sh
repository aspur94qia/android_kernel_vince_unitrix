#!/bin/bash
set -eux
# Patch Halium initrd for vince
echo "Patching initramfs-tools-halium for vince..."

HOOK=$(find. -path "*/hooks/halium" -type f | head -1 || find initramfs-tools-halium -path "*hooks/halium" -type f | head -1)

if [ -z "$HOOK" ]; then
  HOOK="initramfs-tools-halium/hooks/halium"
fi

echo "Hook file: $HOOK"
cat "$HOOK" || true

# Contoh patch buat vince - enable overlay, binder, dll
# Kalau kamu punya patch asli, taro di sini
# sed -i 's/MODPROBE.*/MODPROBE=y/' "$HOOK" || true

echo "Patch done"
