# Howto

## odoo.py
```
$ ./odoo.py --help
$ ./odoo.py --xmlrpc-port=8070
$ ./odoo.py --log-level=debug #debug_sql and debug_rpc
$ ./odoo.py --debug # brings up the python pdb debugger https://docs.python.org/2/library/pdb.html#debugger-commands
```

## Enable Technical Features
* Under User Access Rights
* Provides extra features on the left side bar under settings


## Enable Developer Mode
* About Odoo - Activate Developer Mode

## Apps
* Catalog of App
 * apps.odoo.com
* Community Repo
 * https://github.com/OCA/
 
## Dev System on Same Server
```
$ mkdir /opt/odoo-dev
$ cd /opt/odoo-dev
$ git clone https://www.github.com/odoo/odoo --depth 1 --branch 8.0 --single-branch .
$ mkdir custom_modules
$ cd custom_modules # add to addons path...
$ git clone https://github.com/OCA/department.git -b 8.0 
```

* Update Modules List - Updates list of avaiable modules esp. when new ones have been added via addons...
* Once Updated Look in the Local Modules section


