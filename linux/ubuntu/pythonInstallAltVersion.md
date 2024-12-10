* Reference: http://tecadmin.net/install-python-2-7-on-ubuntu-and-linuxmint/
```
$ sudo apt-get install build-essential checkinstall
$ sudo apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
$ cd /usr/src # or your software folder you use
$ wget https://www.python.org/ftp/python/2.7.10/Python-2.7.10.tgz
$ tar xzf Python-2.7.10.tgz
$ cd Python-2.7.10
$ sudo ./configure
$ sudo make altinstall
$ python2.7 # this should be the new version, but if you run python the system installed version will run
$ python2.7 -V # shows the version
```
