#!/bin/bash

cd /home/pinembour/linux
sudo cp .config ../kernelConfig
git fetch
git checkout -b my$(git describe --tags $(git rev-list --tags --max-count=1)) $(git describe --tags $(git rev-list --tags --max-count=1))
sed -i '/HOSTCFLAGS   :=/c\HOSTCFLAGS   := -Wall -pipe -march=skylake -Wmissing-prototypes -Wstrict-prototypes -O2 \\' ./Makefile
git add Makefile
git commit -m "Makefile adjustments"
make clean && make mrproper
sudo dkms uninstall bbswitch/$(ls /var/lib/dkms/bbswitch | grep -v kernel*) -k $(uname -r)
sudo dkms uninstall wireguard/$(ls /var/lib/dkms/wireguard | grep -v kernel*) -k $(uname -r)
cp ../kernelConfig .config
make -j5
sudo cp ./System.map /boot
sudo cp ./arch/x86_64/boot/bzImage /boot/EFI/Arch/linux.efi
sudo rm -rf /lib/modules/*
sudo make modules_install
sudo dkms install bbswitch/$(ls /var/lib/dkms/bbswitch | grep -v kernel*) -k $(ls /lib/modules)
sudo dkms install wireguard/$(ls /var/lib/dkms/wireguard | grep -v kernel*) -k $(ls /lib/modules)
sudo mkinitcpio -g /boot/EFI/Arch/initramfs.img -k $(ls /lib/modules)
cd /home/pinembour/secure_boot
sudo sbsign --key db.key --cert db.crt --output /boot/EFI/Arch/linux.efi /boot/EFI/Arch/linux.efi
cd
