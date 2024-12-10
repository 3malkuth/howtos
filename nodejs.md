# Nodejs

## Setup

### Option 3: Install nvm
* https://github.com/nvm-sh/nvm
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
source ~/.bashrc
```
* Basic nvm commands
```
nvm list-remote
nvm install v14.6.0
nvm list
nvm use v13.6.0
nvm install lts/erbium
node -v
```

### Option 2: Install node.js and npm
```
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install nodejs npm
```

## Upgrade node.js and npm
### Windows
```
choco upgrade nodejs # or nodejs.install?
```
### Linux
* Note this automatically pulls the version you want from the internet
```
sudo npm cache clean -f
sudo npm install -g n
sudo n stable # or current # sudo n 4.2.1 - if you want to use a specific version
sudo npm update -g
sudo ln -sf /usr/local/n/versions/node/<VERSION>/bin/node /usr/bin/node # for ubuntu, maybe do for npm and npx as well?
# Check new versions
sudo node -v
sudo npm -v
```

# Update packages in your node project
* https://flaviocopes.com/update-npm-dependencies/
```
npm install -g npm-check-updates
ncu -u
npm update #  or npm install
```
