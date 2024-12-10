## Setup
* Go to this link and scroll down to see how to install
### Personal notes
* Download the basic package and unzip
  * http://www.oracle.com/technetwork/topics/linuxx86-64soft-092277.html
* Download the sqlplus package from the same url and unzip into the folder above
* Install this lib
```
sudo apt-get install libaio1
```
* Add the following to .bashrc
```
export LD_LIBRARY_PATH=~/software/instantclient_18_3:$LD_LIBRARY_PATH
export PATH=~/software/instantclient_18_3:$PATH
```
* Create a bash script for logging into your oracle
```
sqlplus username/password@'(DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)
    (HOST=hostname)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=service_name)))'
# OR
sqlplus username/password@'(DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)
    (HOST=hostname)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=service_name)
    (INSTANCE_NAME=instance_name)))'
```
