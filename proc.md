# Proc
* All running process i nlinux can be found under this directory /proc

## Helpful commands

```
cd /proc
ls | grep '[0-9]' # list the process by their ID
ls | grep '[0-9]' | wc -l# This will count how many running process there are
echo $$ # shows ID of your current terminal

cd 1234 # into the folder of a process
cat status
cat limits
cat environ # info about env variables
cat io

cat /proc/net/tcp
# ports and IP's are in hex and backwards
# Use:
# https://www.browserling.com/tools/hex-to-ip
# https://www.rapidtables.com/convert/number/decimal-to-hex.html?x=8090
```


## Bash Script: getNameOfProcess.sh
* cat >getNameOfProcess.sh
```
#!/bin/bash
cat /proc/$1/status | grep Name
```
* cat >getNameOfProcesses.sh
```
#!/bin/bash
PROCESSES=$(ls /proc/ | grep '[0-9]')

for PROCESS in $PROCESSES;do
  echo $PROCESS 
  cat /proc/$PROCESS/status | grep Name
done
```
