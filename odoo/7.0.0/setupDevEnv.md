# OpenERP 7 Eclipse Development Environment
* Ubuntu 12.04.5 LTS Desktop Version

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
* NB!!!! Reboot Linux as postgresql settings need to take effect, later when you try to create a DB in OpenERP you get access denied!!!

## Install Required Software
* Download Eclipse jee latest version and install pythonDev Plugin and Bazaar Plugin
* Install python - If not installed already!!!
* Install python related packages to run openerp
```
$ sudo apt-get install python
$ sudo apt-get install python-dateutil python-docutils python-feedparser python-gdata \
    python-jinja2 python-ldap python-libxslt1 python-lxml python-mako python-mock python-openid \
    python-psycopg2 python-psutil python-pybabel python-pychart python-pydot python-pyparsing \
    python-reportlab python-simplejson python-tz python-unittest2 python-vatnumber python-vobject \
    python-webdav python-werkzeug python-xlwt python-yaml python-zsi
```



## Download and Setup Eclipse
* Download latest version of eclipse (may need to load dependencies of eclipse itself before)
* Install Pydev, but make sure the version suits the version of java you have installed
* Create a Pydev Project called openerp7

## Setup and run OpenERP
* Copy the contents of a latest downloaded version of openerp 7 into this folder and refresh to see it!!
* Create openerp-server.conf file in the project directory with following content 
```
[options]
; This is the password that allows database operations:
; admin_passwd = admin
db_host = localhost
db_port = 5432
db_user = openerp
db_password = <your_password>
addons_path = /home/srvadmin/workspace/openerp7/openerp/addons,/home/srvadmin/workspace/openerp7/custom_modules
log_level = debug
```
* cd into project directory
* Run server from commandline $ python openerp-server --config=openerp-server.conf

or 

* create run configuration in eclipse.

Name: server openerp-server
Project: server
Main Module: ${workspace_loc:server/openerp-server}
Program Argument: --config=openerp-server.conf
* Browse http://localhost:8069


## References
* https://www.youtube.com/watch?v=IaeOq4rbRMw
* https://www.youtube.com/watch?v=RTg8VvyEVak
