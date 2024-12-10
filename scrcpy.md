# scrcpy

## How to add a shortcut for scrcpy

* Add the following file (scrcpy.desktop) to: /usr/share/applications
```
[Desktop Entry]
Version=1.0
Type=Application
Name=scrcpy
Comment=Mobile Phone Remote Access
Exec=scrcpy 
TryExec=scrcpy
Icon=phone-symbolic
Terminal=false
Categories=Development;GTK;
StartupNotify=true
```
* Open scrpy and right-click on gnome icon on left taskbar. Choose add to favorites
