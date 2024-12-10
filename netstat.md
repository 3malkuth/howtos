# Netstat

## How to find port or domain of a specific connection
```
netstat -T | grep <snippet from domain>
netstat -antp | grep <process number> # This will give you the port that domain is listening on
netstat -tup -W | column -t | grep <snippet from domain>
```
