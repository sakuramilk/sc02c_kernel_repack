#!/bin/bash

chown -R root:root $1

cd $1
tar cvf mbs.tar $(basename /mbs)
tar cvf vendor.tar $(basename /vendor)
tar cvf res.tar $(basename /res)

mkdir compress
mv sbin/nandroid-md5.sh compress/
mv sbin/bootanimation.sh compress/
mv sbin/bootanimation compress/
mv sbin/killrecovery.sh compress/
mv sbin/fota.png compress/
mv sbin/fix_permissions compress/
mv sbin/sdparted compress/
mv sbin/fat.format compress/
mv sbin/adbd compress/
mv sbin/tune2fs compress/
#mv sbin/parted compress/
mv sbin/e2fsck compress/
mv sbin/sreadaheadd compress/
tar cvf compress.tar $(basename /compress)

cat mbs.tar | lzma -v > mbs.tar.lzma
cat vendor.tar | lzma -v > vendor.tar.lzma
cat res.tar | lzma -v > res.tar.lzma
cat compress.tar | lzma -v > compress.tar.lzma

rm *.tar
rm -rf mbs
rm -rf vendor
rm -rf res
rm -rf compress

find . | xargs chown 1000:1000
cd ../
