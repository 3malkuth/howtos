#Install Seafile Server Howto
* Ubuntu 14.04
* Python 2.7

##Requirements Setup
```
$sudo apt-get install openjdk-7-jre poppler-utils \
 libreoffice libreoffice-script-provider-python libpython2.7 \
 python-pip mysql-server python-setuptools python-imaging python-mysqldb
$ sudo pip install boto
```
##Download Seafile Software
* Download for 32bit
```
https://bitbucket.org/haiwen/seafile/downloads/seafile-server_{version}_i386.tar.gz
```
* Download for 64bit
```
https://bitbucket.org/haiwen/seafile/downloads/seafile-server_{version}_x86-64.tar.gz
```

##Setup Directories
```
$ mkdir org_name
$ mv seafile-server_* org_name
$ cd org_name
$ tar -xzf seafile-server_* # after you move seafile-server_* to this new directory
$ mkdir installed
$ mv seafile-server_* installed
```
* Benefits of this directory Structure is:
 * TODO: We can place all the config files for Seafile server inside "haiwen" directory, making it easier to manage.
 * TODO: When you upgrade to a new version of Seafile, you can simply untar the latest package into "haiwen" directory. In this way you can reuse the existing config files in "haiwen" directory and don't need to configure again.

##Setup Mysql Databases
```
$ cd ~/seafileDir/seafile-server-...
$./setup-seafile-mysql.sh
```
* Follow prompts and choose defaults
 * Except I would caution you to use a new user for the mysql DB and not root...

* TODO: The folder seafile-server-latest is a symbolic link to the current seafile server folder. When later you upgrade to a new version, the upgrade scripts would update this link to keep it always point to the latest seafile server folder.
* TODO: Since Seafile uses persistent connection between client and server, if you have '''a large number of clients ''', you should increase Linux file descriptors by ulimit before start seafile, like:
```
$ ulimit -n 30000
```

##Setup Boot and Shutdown Script
* Open up a file /etc/init.d/seafile-server
```
#!/bin/bash

# Change the value of "user" to your linux user name
user=haiwen

# Change the value of "seafile_dir" to your path of seafile installation
seafile_dir=/data/haiwen
script_path=${seafile_dir}/seafile-server-latest
seafile_init_log=${seafile_dir}/logs/seafile.init.log
seahub_init_log=${seafile_dir}/logs/seahub.init.log

# Change the value of fastcgi to true if fastcgi is to be used
fastcgi=false
# Set the port of fastcgi, default is 8000. Change it if you need different.
fastcgi_port=8000

case "$1" in
        start)
                sudo -u ${user} ${script_path}/seafile.sh start >> ${seafile_init_log}
                if [  $fastcgi = true ];
                then
                        sudo -u ${user} ${script_path}/seahub.sh start-fastcgi ${fastcgi_port} >> ${seahub_init_log}
                else
                        sudo -u ${user} ${script_path}/seahub.sh start >> ${seahub_init_log}
                fi
        ;;
        restart)
                sudo -u ${user} ${script_path}/seafile.sh restart >> ${seafile_init_log}
                if [  $fastcgi = true ];
                then
                        sudo -u ${user} ${script_path}/seahub.sh restart-fastcgi ${fastcgi_port} >> ${seahub_init_log}
                else
                        sudo -u ${user} ${script_path}/seahub.sh restart >> ${seahub_init_log}
                fi
        ;;
        stop)
                sudo -u ${user} ${script_path}/seafile.sh $1 >> ${seafile_init_log}
                sudo -u ${user} ${script_path}/seahub.sh $1 >> ${seahub_init_log}
        ;;
        *)
                echo "Usage: /etc/init.d/seafile {start|stop|restart}"
                exit 1
        ;;
esac
```
* File Permissions and RC Level Setup etc.
$ sudo chmod 755 /etc/init.d/seafile-server
$ sudo chown root: /etc/init.d/seafile-server
$ sudo update-rc.d seafile-server defaults 99
##

##References
* http://manual.seafile.com/deploy_pro/download_and_setup_seafile_professional_server.html
* http://manual.seafile.com/deploy/using_mysql.html
* http://manual.seafile.com/deploy/start_Seafile_at_system_bootup.html
