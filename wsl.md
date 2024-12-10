# Windows Sub-system Linux

## Install
* Don't use choco... install from store
* In search look for ubuntu and run as administrator
  * You will be asked to enter default & admin user for ubuntu and password
## Configure
```
wslconfig /l # distribution that has been setup
wslconfig /u Ubuntu-... # name of the distribution shown above
ubuntu config --default-user new_user_name # do this to change the default user
```

## Setup VSCode with WSL
* https://code.visualstudio.com/docs/remote/wsl
  * THIS LINK IS SUPER IMPORTANT U NEED TO INSTALL EXTENSION SO THAT IT WORKS!!!!
* Just run code . in ubuntu and it will fire up

## Issues cloning into mounted win drive
```
If you get the following when you clone into a win drive
fatal: could not set 'core.filemode' to 'false'

sudo umount /mnt/c
sudo mount -t drvfs C: /mnt/c -o metadata
```

## Multiple Terminals
* For now simplky open any cmd and type ubuntu1804
  * There is a new cool terminal coming

## References
* https://docs.microsoft.com/en-us/windows/wsl/wsl-config
