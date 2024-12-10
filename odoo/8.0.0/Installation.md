#Odoo Installation Howto
* Ubuntu 14.04 LTS

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

##Create the odoo user (owns and runs application)
```
$ sudo adduser --system --home=/opt/odoo --group odoo
```
This is user is of type “system”. It own's and run's the application. It is not a "person" type with a login.
Ubuntu:
* System user gets a UID below 1000
* Has no shell (/bin/false)
* Logins disabled.
* Note:
 * “home” set to /opt/odoo (OpenERP server code will reside here)
 * Folder is created automatically.
 * You can choose where to put the server code, but this will mean you need to change some of the commands in this tutorial
 * If you wish to sudo into this user with a shell, run this command
```
$ sudo su - odoo -s /bin/bash
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
$ createuser --createdb --username postgres --no-createrole --superuser --pwprompt odoo
```
* Note
 * User has access rights to PostgreSQL
 * Create and Drop Databases
 * User: odoodbuser0001, pass f...
* Exit from the account
```
$ exit
```

##Install necessary Python Libraries
```
$ sudo apt-get install python-dateutil python-decorator python-docutils python-feedparser \
  python-gdata python-gevent python-imaging python-jinja2 python-ldap python-libxslt1 python-lxml \
  python-mako python-mock python-openid python-passlib python-psutil python-psycopg2 python-pybabel \
  python-pychart python-pydot python-pyparsing python-pypdf python-reportlab python-requests \
  python-simplejson python-tz python-unittest2 python-vatnumber python-vobject python-werkzeug \
  python-xlwt python-yaml wkhtmltopdf
```

##Install odoo server
* Install git
```
$ sudo apt-get install git
```
* Switch over to oddo user
```
$ sudo su - odoo -s /bin/bash
```
* Download a copy of the latest odoo 8.0 branch
```
$ git clone https://www.github.com/odoo/odoo --depth 1 --branch 8.0 --single-branch .
```
* Note:
 * --depth 1 only downloads the latest files without all the change history (a lot quicker)
* Exit from the account
```
$ exit
```

##Odoo application configuration
* TODO: The default configuration file for the server (/opt/odoo/debian/openerp-server.conf) is actually very minimal and will, with only a small change work fine so we’ll copy that file to where we need it and change it’s ownership and permissions...
```
$ sudo cp /opt/odoo/debian/openerp-server.conf /etc/odoo-server.conf
$ sudo chown odoo: /etc/odoo-server.conf
$ sudo chmod 640 /etc/odoo-server.conf
```
* Note
 * TODO: The above commands make the file owned and writeable only by the odoo user and group and only readable by odoo and root.
* Create Log file directory and set correct permissions
```
$ sudo mkdir /var/log/odoo
$ sudo chown odoo:root /var/log/odoo
```
* Edit /etc/odoo-server.conf
```
db_host = localhost
db_port = 5432
db_user = odoo
db_password = f...
addons_path = /opt/odoo/addons
logfile = /var/log/odoo/odoo-server.log
```
* Test the Server Runs
```
$ sudo su - odoo -s /bin/bash
$ /opt/odoo/openerp-server
```
TODO: If you end up with a few lines eventually saying OpenERP (Yes. The log still says OpenERP and not Odoo) is running and waiting for connections then you are all set.
TODO: If there are errors, you’ll need to go back and find out where the problem is.
TODO: Otherwise simply enter CTL+C to stop the server and then exit to leave the openerp user account and go back to your own shell.

##Install the Boot Script
* Download Script
 * http://www.theopensourcerer.com/wp-content/uploads/2014/09/odoo-server
* Create file /etc/init.d/odoo-server
```
$ sudo touch /etc/init.d/odoo-server
$ sudo chmod 755 /etc/init.d/odoo-server
$ sudo chown root: /etc/init.d/odoo-server
```
* Copy Contents of URL into File
* Test the Server
```
$ sudo /etc/init.d/odoo-server start
```
* Login to http://IP:8069
* Test stopping the server
```
$ sudo /etc/init.d/odoo-server stop
```

##Load to Run on Boot
* Download this Script: http://www.theopensourcerer.com/wp-content/uploads/2014/09/odoo-server
* Place this script in /etc/init.d/
* Change the Permissions and Ownership:
```
$ sudo chmod 755 /etc/init.d/odoo-server
$ sudo chown root: /etc/init.d/odoo-server
```
* Test the Server and check if functioninig properly by monitoring /var/log/odoo/odoo-server.log...
```
$ sudo /etc/init.d/odoo-server start
$ sudo /etc/init.d/odoo-server stop
```
* Setup to run on boot
```
$ sudo update-rc.d odoo-server defaults 99
```
##Initial Database Configuration
* When you login to: http://IP_ADDRESS:8069 you will initially be forwarded to:
 * http://IP_ADDRESS:8069/web/database/manager#action=database_manager
* The default password is admin, you can change it on the left hand side at the bottom of the  menu
 * Please change the Master password for Security reasons!!!
* You should setup at least two databases: one for testing and another for production
* 


##References
* http://www.theopensourcerer.com/2014/09/how-to-install-openerp-odoo-8-on-ubuntu-server-14-04-lts/
