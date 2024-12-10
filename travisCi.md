# Travis CI

## Local Client
* Install local client
  * Install ruby vm
     * https://www.digitalocean.com/community/tutorials/how-to-install-ruby-and-set-up-a-local-programming-environment-on-ubuntu-16-04
```
curl -sSL https://get.rvm.io -o rvm.sh
cat rvm.sh | bash -s stable
source ~/.rvm/scripts/rvm
rvm install ruby --2.1 # --default
gem install travis
```
* Log In
```
travis login
travis login --pro
```
## Created Encrypted Key or File
```
travis encrypt <number u want to encrypt>
~/.rvm/gems/ruby-2.4.1/bin/travis encrypt <number you want to encrypt>
```

## References
* https://docs.travis-ci.com/user/sonarcloud/
