## Pre-Steps
* Setup node and npm as in the other howot

## Install yarn
```
npm install yarn # optional --global
```

## Install dependencies in package.json
* Build this package.json file

```
{
  "name": "react-app",
  "version": "0.0.1",
  "private": true,
  "dependencies": {
    "react": "^16.2.0",
    "react-dom": "^16.2.0",
    "yarn": "^1.3.2"
  },
  "devDependencies": {
    "react-scripts": "^1.1.1",
    "jest-cli": "^22.4.0"
  },
  "scripts": {
    "start": "react-scripts start",
    "build": "react-scripts build",
    "test": "react-scripts test --env=jsdom",
    "eject": "react-scripts eject"
  }
}
```

```
npm install
```

## Yarn Build
```
node/yarn/dist/bin/yarn build
```

## Build HelloWorld App
```
npm install create-react-app # Optional -g
/<PATH>/create-react-app helloworld
cd helloworld
npm start
```
* Browse: http://localhost:3000


## References
* https://github.com/facebook/create-react-app
* https://github.com/facebook/create-react-app/blob/master/packages/react-scripts/template/README.md#npm-run-eject
