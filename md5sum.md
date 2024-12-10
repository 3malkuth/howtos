# MD5 Sum

## Hashing a String
```
./md5Hash.sh "something I want to hash"
#!/bin/bash
echo -n $1 | md5sum | awk '{print $1}'
```
* OR
```
./md5Hash.sh 'something I want to hash'
#!/bin/bash
echo -n "$1" | md5sum -| awk '{print $1}'
```
