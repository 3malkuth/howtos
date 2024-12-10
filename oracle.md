## Download
* sqldeveloper
  * http://www.oracle.com/technetwork/developer-tools/sql-developer/overview/index-097090.html
* sqlplus
  * http://www.oracle.com/technetwork/database/features/instant-client/index-097480.html
  * http://www.oracle.com/technetwork/topics/linuxx86-64soft-092277.html

## Install
* sqldeveloper
  * https://www.youtube.com/watch?v=dWnAizA1bYE
* sqlplus
  * https://help.ubuntu.com/community/Oracle%20Instant%20Client

## Setup Notes
```
$ export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib/${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
# Optional depends on situation - check install page
$ export ORACLE_HOME=/usr/lib/oracle/12.1/client64
$ export PATH=$PATH:$ORACLE_HOME/bin
$ sudo ln -s /usr/include/oracle/12.1/client64 $ORACLE_HOME/include
```

## IntelliJ
* https://www.jetbrains.com/help/idea/2017.1/database-tool-window.html
* https://www.jetbrains.com/help/idea/2017.1/database-console.html
* https://stackoverflow.com/questions/41899741/how-to-connect-intellij-to-oracle
