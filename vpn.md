# OPENCONNECT
```
$ sudo openconnect --user=<user login> --key-password=<your login password> <domain of gateway>
```

# Appgate
* http://www.cisco.com/c/en/us/support/security/anyconnect-secure-mobility-client/tsd-products-support-series-home.html

## Download
* First get the URL for the cisco router from the company
 * https://x.appgate.de
 * If you browse to the URL you should get the option to download the client
* Make sure you download the one for linux
 * Best to use the single user then you do not need to install it

 
## Install
```
$ sudo apt-get install -y lib32z1 lib32ncurses5
$ sudo apt-get install network-manager-openconnect
$ sudo systemctl daemon-reload
```
* Simply unzip the single user client, and navigate to the bin directory and run
```
$ ./agclient
```
* Refer to val... notes for connection info

 ## References
 * https://technicalsanctuary.wordpress.com/2016/05/28/installing-cisco-anyconnect-vpn-on-ubuntu-16-04/
