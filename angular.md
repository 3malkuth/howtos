# Angular

## Angular 9
```
sudo npm install -g @angular/cli
```
* If you run into problems with version 9 of angular cli you can roll back to a previous version...
```
ng --version
sudo npm uninstall -g @angular/cli
sudo npm cache clean --force
npm install -g @angular/cli@8.0.0
npm cache verify
ng --version
```
