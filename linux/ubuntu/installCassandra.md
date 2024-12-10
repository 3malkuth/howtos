```
$ # Install Python 2.7.10 for cqlsh
$ wget  http://www.apache.org/dyn/closer.lua/cassandra/3.7/apache-cassandra-3.7-bin.tar.gz
$ tar -xvzf apache-cassandra-3.7-bin.tar.gz
$ cd apache-cassandra-3.7/bin
$ ./cassandra # runs as daemon
$ ./cassandra -f # runs in the foreground
# New window
$ vim cqlsh
# python2.7 -c 'import sys; sys.exit(not (0x020700b0 < sys.hexversion < 0x03000000))' 2>/dev/null \
#   && exec python2.7 "`python2.7 -c "import os;print(os.path.dirname(os.path.realpath('$0')))"`/cqlsh.py" "$@"
$ ./cqlsh
$ run init script in it...
```
