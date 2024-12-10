# Howto

## Setup
* Download Branch 7.0 - https://github.com/OCA/geospatial/tree/7.0
* Install Odoo 7.0
* Install the following extra packages
```
$ sudo apt-get install postgis libgeos-3.2.2 libgeos-c1 libgeos-dev libgeos-dbg python-shapely postgresql-server-dev-all postgresql-9.1-postgis

$ sudo pip install geojson
```
* Setup Postgresql Addons
```
$ sudo su - postgres
$ ./create_postgis_template.sh # you need to create this bash script from the file below
```


## File: create_postgis_template.sh
```
#!/bin/bash

# Set postgis-1.5 path.
POSTGIS_SQL_PATH=`pg_config --sharedir`/contrib/postgis-1.5

# Creating the template spatial database
createdb -E UTF8 -T template0 template_postgis
# and add PLPGSQL language support.
createlang -d template_postgis plpgsql

# Loading the PostGIS SQL routines.
psql -d template_postgis -f $POSTGIS_SQL_PATH/postgis.sql
psql -d template_postgis -f $POSTGIS_SQL_PATH/spatial_ref_sys.sql

# Enabling users to alter spatial tables.
psql -d template_postgis -c "GRANT ALL ON geometry_columns TO PUBLIC;"
psql -d template_postgis -c "GRANT ALL ON geography_columns TO PUBLIC;"
psql -d template_postgis -c "GRANT ALL ON spatial_ref_sys TO PUBLIC;"

# Garbage-collect and freeze.
psql -d template_postgis -c "VACUUM FULL;"
psql -d template_postgis -c "VACUUM FREEZE;"

# Allows non-superusers the ability to create from this template.
psql -d postgres -c "UPDATE pg_database SET datistemplate='true' WHERE datname='template_postgis';"
psql -d postgres -c "UPDATE pg_database SET datallowconn='false' WHERE datname='template_postgis';"
```

