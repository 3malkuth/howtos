## How to Create a Module
* OpenErp 7.0.0
* Ubuntu 12.04.5

## Create Custom Modules Folder
```
$ sudo su - openerp -s /bin/bash
$ mkdir custom_modules
$ cd custom_modules
$ vim __init__.py
* Add the following line of code to the file to show the system that this contains addons/modules
## start file edit ########################################################
from openerp.modules import get_module_resource, get_module_path
## end file edit ########################################################
```
* When you run openerp you need to tell the system about these changes
 * Development
```
$ cd ~
$ python /opt/openerp/server/openerp-server --addons-path=/opt/openerp/server/openerp/addons,/opt/openerp/custom_modules
```
 * Production - Add to the config file: /etc/openerp-server.conf - addons_path

## Create Module
* Setup Module Folder
```
$ cd custom_modules
$ mkdir <name_of_project_folder>
$ cd <name_of_project_folder>
$ touch __init__.py # Leave empty for now
```
* In order for OpenERP to recognize your module we need to create a module declaration file
```
$ vim __openerp__.py
## start file edit ########################################################
{
    'name': "Name of Project",
    'version': "1.0",
    'author': "some name",
    'category': "Tools",
    'depends': ['project'],
    'data': [],
    'demo': [],
    'installable': True,
}
## end file edit ########################################################



## References
* http://www.pixelite.co.nz/article/adding-additional-fields-using-custom-module-openerp-7/
