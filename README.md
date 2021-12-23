# arch_linux_setup

# Intial setup

First need to partition your disk to allow UEFI setup.  Use **fdisk** to setup the required partitions.  Make sure you use the disk for the machine you are using.

```
fdisk -l

# Partition the drive (Your drive might be different)
fdisk /dev/sda

# Create GPT partion table
g
n
# Enter for default
# Enter for default
# Set the size for EFI partion
+500M
t
1
n
# Enter for default
# Enter for default
# Enter for default
t
# Enter for default
30
w

# Check that the partion looks correct and is bootable
fdisk -l

# Format the EFI file system
mkfs.fat -F32 /dev/sda1

# Create logical volumes
pvcreate --dataalignment 1m /dev/sda2
vgcreate volgroup0 /dev/sda2
lvcreate -l 100%FREE volgroup0 -n lv_root

# Add the device management module to kernel
modprobe dm_mod

# Make sure the volume group shows up
vgscan

# Make the volume group active
vgchange -ay

# Format the volume
mkfs.ext4 /dev/volgroup0/lv_root

# Mount the volume
mount /dev/volgroup0/lv_root /mnt

# Create the /mnt/etc directory and update fstab
mkdir /mnt/etc
genfstab -U -p /mnt >> /mnt/etc/fstab

# Install ArchLinux
pacstrap -i /mnt base git

# Finally, change to root in the new system
arch-chroot /mnt
```

After creating the partions and accessing new system clone this project into your new system so you can use the convenience scripts
