# Howto create a custom module

## Initialize Custom Module Folder
```
$ sudo su - odoo -s /bin/bash
$ ./odoo.py scaffold Academy custom-modules
```

## Start Odoo including the modules folder
```
$ ./odoo.py --addons-path addons,custom-modules
```
* Login to the Web Interface and Create a new database with default data
* Go to Settings -> Modules -> Local Modules
* Ditch Filters and Search for "Academy"
* Install the App

## Next Steps
* Edit Controllers, Templates and Model Files in the academy folder
* Ensure they are included in the __init__.py file
* Restart odoo.py everytime you have made changes
* Go to the URL extension specified in the controllers class to test your module.
* Essentially continue with the tutorial Referenced below

## TO RESTART ODOO AND UPDATE THE MODULES AT THE SAME TIME
```
$ ./odoo.py --addons-path addons,custom-modules -d TestEN0001 -u academy
```
* -d is the name of the database
* -u is the name of the module to be updated

## References
* https://www.odoo.com/documentation/8.0/howtos/website.html
