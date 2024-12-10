* Create a file filled with zero of any size you want
```
$ dd if=/dev/zero of=blah.blah count=1 bs=1 seek=4999999999 # Almost a 5GB file...
```
