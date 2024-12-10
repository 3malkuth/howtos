# Postgresql Howto

## Postgresql Client
```
sudo apt-get install postgresql-client
psql -U postgres -d prs -h 127.0.0.1 -p 5432
```

## Access Postgresql Safely
```
$ sudo su  - postgres
$ psql # logs you into the main database called postgres as user postgres
```

## Delete Database Completely
```
$ sudo su - postgres
$ dropdb _name_
```


## Database Commands
* List Databases
```
postgres=# \l
                                  List of databases
   Name    |  Owner   | Encoding |   Collate   |    Ctype    |   Access privileges   
-----------+----------+----------+-------------+-------------+-----------------------
 postgres  | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 template0 | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres          +
           |          |          |             |             | postgres=CTc/postgres
 template1 | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres          +
           |          |          |             |             | postgres=CTc/postgres
 testEng   | openerp  | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
(4 rows)
```
* Change Databases
```
postgres=# \c testEng;
You are now connected to database "testEng" as user "postgres".
```
* List Tables in Database
```
postgres=# \dt
```
* List Columns of Table
```
postgres=# \d+ table_name
```
* Obtain info using standard SQL command
```
postgres=# select * from pg_catalog.pg_tables;
```
