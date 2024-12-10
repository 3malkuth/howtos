# Laptop Setup

## Swap Space
* Up to 2GB of RAM should be 2 x amount of installed RAM
* Above 2GB it should be amount of RAM + 2GB

## Dual Boot Windows / Ubuntu
* Resize windows partition
* Then a do a normal install of ubuntu with...
  * encryption of /
  * 4MB bootgrup
  * 1024MB /boot
  * Add proprietary drivers or sudo apt-get update && sudo apt-get upgrade after install for device drivers

### Software List
* Change /bin/sh to point to /bin/bash
```
sudo cp /bin/sh /bin/sh.original
sudo rm -rf /bin/sh
sudo ln -s /bin/bash /bin/sh

```
* Install git
* Setup ssh key and add to online git repos

* SSH and scripts
* /etc/hosts
* Git
  * Git auth details
* Oracle Java JDK 8
* Maven
* IntelliJ
* Chrome
* Hipchat
* Slack
* Oracle SQL Developers
* Docking Station
* Numix design
  * https://itsfoss.com/install-numix-ubuntu/
* Gnome zoom tool
* openconnect
* Add /etc specific files to git that you edited by hand
  * First commit the original then commit your changes
