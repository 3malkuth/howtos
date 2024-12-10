# svn

## Checkout
```
svn checkout http://svn.server.com/svn/project_repo --username=tom
svn co http://svn.server.com/svn/project_repo --username=tom
```
 
## Check Status
```
svn status
```

## Add files to pending change-list
```
svn add <filename>
svn add * --force # recursively into added folders
```

## Commit
```
svn commit -m "Commit message..." # Pushes as well...
```

* svn log
* svn diff

## References
* https://www.tutorialspoint.com/svn/index.htm
