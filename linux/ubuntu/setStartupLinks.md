# Howto Set Startup Links in Ubuntu for Boot Scripts

## Set the Links
```
$ sudo update-rc.d script_name defaults 99
```

## Remove Links
```
$ sudo update-rc.d -f script_name remove
```

