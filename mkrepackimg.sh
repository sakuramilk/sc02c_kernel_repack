#!/bin/bash

INITRAMFS_DIR=./sc02c_initramfs

if [ -d $INITRAMFS_DIR ]; then
  sudo rm -rf $INITRAMFS_DIR
fi
cp -a ../sc02c_initramfs ./
rm -rf $INITRAMFS_DIR/.git
find $INITRAMFS_DIR -name .gitignore | xargs rm

rm $INITRAMFS_DIR/lib/modules/Si4709_driver.ko
rm $INITRAMFS_DIR/sbin/parted
#rm $INITRAMFS_DIR/sbin/tune2fs
#rm $INITRAMFS_DIR/sbin/fat.format
rm $INITRAMFS_DIR/mbs/recovery/recovery.single
#rm $INITRAMFS_DIR/mbs/recovery/updater
if [  -f $INITRAMFS_DIR/mbs/recovery/recovery.multi ]; then
  mv $INITRAMFS_DIR/mbs/recovery/recovery.multi $INITRAMFS_DIR/sbin/recovery
fi

sudo ./compress.sh $INITRAMFS_DIR

./repack.sh zImage.orig sc02c_initramfs zImage_ics
