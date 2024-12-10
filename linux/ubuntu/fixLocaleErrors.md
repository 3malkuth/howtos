#Ubuntu Fix Locale Errors Howto

##Process
###Temporary Fix - After Reboot won't work anymore
* Run the following set of commands
```
$ export LANGUAGE=en_US.UTF-8
$ export LANG=en_US.UTF-8
$ export LC_ALL=en_US.UTF-8
$ locale-gen en_US.UTF-8
$ sudo dpkg-reconfigure locales
```
* To test the locales are working run the following command
```
$ locale
```
* If not set correctly you will probably get an arror as follows:
```
locale: Cannot set LC_CTYPE to default locale: No such file or directory
locale: Cannot set LC_ALL to default locale: No such file or directory
```

###Permanent Fix
* Run the following set of commands
```
$ export LANGUAGE=en_US.UTF-8
$ export LANG=en_US.UTF-8
$ export LC_ALL=en_US.UTF-8
$ locale-gen en_US.UTF-8
$ sudo dpkg-reconfigure locales
```
* Place the following in your .bashrc file
```
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
```
* To test the locales are working run the following commands
```
$ locale
```
* If not set correctly you will probably get an arror as follows:
```
locale: Cannot set LC_CTYPE to default locale: No such file or directory
locale: Cannot set LC_ALL to default locale: No such file or directory
```


##References
* https://www.flynsarmy.com/2011/04/fixing-perl-locale-errors-in-a-clean-ubuntu-install/
* http://www.pixelninja.me/how-to-fix-invalid-locale-setting-in-ubuntu-14-04-in-the-cloud/
* https://help.ubuntu.com/community/Locale#List_current_settings
