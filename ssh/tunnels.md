## SSH Tunnels
* server1 -> server2
 * Access locally via: server2:8888
```
$ ssh -p2222 root@server2 -L server2:8888:localhost:8888
```
* server1 -> server2 -> server3
  * Access locally via: server2:8888
```
$ ssh -p2222 root@server2 -L server2:8888:server3:9999
```
