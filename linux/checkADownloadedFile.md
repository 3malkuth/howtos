* Download file
* Download the md5sum file over https
* Download the KEYS file
* Download the asc file over https
* All these files must be in the same folder
* md5sum kafka_2.11-0.10.0.1.tgz
* cat kafka_2.11-0.10.0.1.tgz.md5
* Visually compare the numbers
* gpg --import KEYS
* gpg --verify *.asc
* once this has been checked you can use the file...
