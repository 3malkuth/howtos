# Mongo DB Cheatsheet

## Command Line Tool
```
$ mongo
```

## Database commands

* Create a Database
```
> use <newDB>;
```

* Show Databases
```
> show dbs;
```

* Drop Database
 * This will drop the current database you are working in  
```
> db.dropDatabase(); 
```

* Show the name of the current database
```
> db.getName();
```

## Collection commands


* Show Collections
```
> show collections;
```

* Show items in a collection
```
> db.<collectionName>.find();
```

* Create items in a collection
```
>  db.<collectionName>.insert({"name" : "Don Draper"});
```

* Remove item in a collection
```
>  db.<collectionName>.remove({"_id":ObjectId("550ef996bca11fc0a6df88d0")});
>  db.<collectionName>.remove({ "_id" : "40"});
```

* Update item in a collection
```
$ db.<collectionName>.save({_id:ObjectId('550ef996bca11fc0a6df88d0'),"name" : "Dick Whitman" });
```

* Drop a collection
```
$ db.<collectionName>.drop();
```
