## Find by name
  * find /path option filename
```
# Case sensitive look for this filename
$ find / -name linux.odt
# Find all files case-insensitive containing the text in their filename somewhere
$ find . -iname *somepartoftext*
```
## Find by type
```
# Find by type - symbolic link
$ find / -type l
# Find by type and name
$ find /etc -type f -name “*.conf”
```
## Find by size
```
$ find / -size +1000MB
```
## Output results to a file
```
$ find /etc -type f -name “*.conf” > conf_search
```

## References
* https://www.linux.com/learn/intro-to-linux/2017/3/how-search-files-linux-command-line
