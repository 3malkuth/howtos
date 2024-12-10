#Odoo Installation Howto
* Odoo 7.0 / OpenERP 7.0
* Ubuntu 12.04.5 LTS

##Build Your Server
* Install Minimal Ubuntu and ssh server
```
$ sudo apt-get install openssh-server
```
* Ensure latest version of software
```
$ sudo apt-get update
$ sudo apt-get dist-upgrade
```

##Create the openerp user (owns and runs application)
```
$ sudo adduser --system --home=/opt/openerp --group openerp
```
This is user is of type “system”. It own's and run's the application. It is not a "person" type with a login.
Ubuntu:
* System user gets a UID below 1000
* Has no shell (/bin/false)
* Logins disabled.
* Note:
 * “home” set to /opt/openerp (OpenERP server code will reside here)
 * Folder is created automatically.
 * You can choose where to put the server code, but this will mean you need to change some of the commands in this tutorial
 * If you wish to sudo into this user with a shell, run this command
```
$ sudo su - openerp -s /bin/bash
```

##Install and configure the database server (PostgreSQL)
* Install Postgresql Server
```
$ sudo apt-get install postgresql
```
* Change to the Postgres User so you have the permissions necessary to create databases etc.
```
$ sudo su - postgres
```
* Create a database user
```
$ createuser --createdb --username postgres --no-createrole --superuser --pwprompt openerp
```
* Fix Locales
* Run
```
$ sudo pg_createcluster 9.1 main --start
```

##Install necessary Python Libraries
```
$ sudo apt-get install python-dateutil python-docutils python-feedparser python-gdata \
python-jinja2 python-ldap python-libxslt1 python-lxml python-mako python-mock python-openid \
python-psycopg2 python-psutil python-pybabel python-pychart python-pydot python-pyparsing \
python-reportlab python-simplejson python-tz python-unittest2 python-vatnumber python-vobject \
python-webdav python-werkzeug python-xlwt python-yaml python-zsi
```
## Download and Setup OpenErp 7.0
```
$ wget http://nightly.odoo.com/7.0/nightly/src/openerp_7.0.latest.tar.gz
$ cd /opt/openerp
$ sudo tar -xvzf openerp_7.0.latest.tar.gz 
```
* Login to the openerp user
```
$ sudo su - openerp -s /bin/bash
$ ln -s openerp-7.0-20150216 server
$ exit

```

## Alternatively Can Try Git, but often problematic
##Setup Openerp with Git
* Install Git
```
$ sudo apt-get install git
```
* Login to the openerp user
```
$ sudo su - openerp -s /bin/bash
```
* Download latest git version of openerp 7 from the git repo
```
$ git clone https://www.github.com/odoo/odoo --depth 1 --branch 7.0 --single-branch .
OR
$ git clone https://www.github.com/odoo/odoo --depth 1 --branch 7.0 .
$ exit
```
## Ensure File Permissions are set correctly in the OpenErp home directory
```
$ cd /opt/openerp
$ sudo chown -R openerp: *
```

## Configure Openerp
```
$ sudo cp /opt/openerp/debian/openerp-server.conf /etc/
$ sudo chown openerp: /etc/openerp-server.conf
$ sudo chmod 640 /etc/openerp-server.conf
```
* Edit /etc/open/server.conf
```
[options]
; This is the password that allows database operations:
; admin_passwd = admin
db_host = localhost
db_port = 5432
db_user = openerp
db_password = your_password
addons_path = /usr/lib/python2.7/dist-packages/openerp/addons
logfile = /var/log/openerp/openerp-server.log
```
* Create & Setup logfile folder
```
$ sudo mkdir /var/log/openerp
$ sudo chown openerp:root /var/log/openerp
```
* Test the configuration
```
$ sudo su - openerp -s /bin/bash
$ /opt/openerp/<server>/openerp-server # Use the "server" option if you used wget
```

##References
* http://www.theopensourcerer.com/2012/12/how-to-install-openerp-7-0-on-ubuntu-12-04-lts/
* http://www.theopensourcerer.com/2014/09/how-to-install-openerp-odoo-8-on-ubuntu-server-14-04-lts/
