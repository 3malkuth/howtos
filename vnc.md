## Install
```
# First install either one of the following: xtight or tiger http://www.karlrunge.com/x11vnc/ssvnc.html
sudo apt-get install xtightvncviewer
sudo apt-get install ssvnc
sudo apt-get install x11vnc
sudo apt-get install vncviewer
```

## Run
```
$ cat shareServer.sh
    ---
    #!/bin/bash
    # 0+0 means top left corner
    # share the top left screen
    # must put in the resolution of top left screen
    x11vnc -nobell -clip 1920x1200+0+0 "$@"
    # x11vnc -nobell -clip 3840x2160+3840+0 "$@" # this uses the right hand view
    ---
$ cat shareView.sh
    ---
    #!/bin/bash
    # client of screen server created
    # this is what you share as a screen in web apps...
    vncviewer :0 -noraiseonbeep -viewonly "$@"
    ---
```
