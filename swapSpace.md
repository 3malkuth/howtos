# Swap Space
* Up to 2GB of RAM should be 2 x amount of installed RAM
* Above 2GB it should be amount of RAM + 2GB

## Root swapfile pattern
* WHY?
  * NOTE! This does not support tuksOnIce
  * You usually do this when you forgot to setup a swap partition for your system
  * Usually a swapfile is created in "/" by default with size 2GB
  * We want to resize it for our system
* HOW
  * Check setup of swapfile space in /etc/fstab
    * "/swapfile" is entry in file
  * sudo bash
    * Login as root
  * Navigate to "/"
  * ls a-lh swapfile
  * swapon
    * This should show if the swapfile is activated
  * swapoff swapfile
    * Unmounts swapfile
  * cp swapfile swapfile.orig
    * Backup swapfile
  * dd if=/dev/zero of=swapfile bs=18M count=1024
    * Create bigger swapfile (18 GB)
      * M stands for 1024
      * 18 * 1024 * 1024 = 18GB
  * mkswap swapfile
    * Create swap file filesystem
  * swapon -a
* CHECK
  * swapon
  * free -h
  * Reboot and check its still working
    * If it is working you can get rid of the backup swapfile
