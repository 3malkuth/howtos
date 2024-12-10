## Install

* curl -s get.sdkman.io | bash
* source "$HOME/.sdkman/bin/sdkman-init.sh"
* test with "sdk version"

### Install to custom location
* Prior to the install process run:
 * export SDKMAN_DIR="/usr/local/sdkman" && curl -s get.sdkman.io | bash

### Install Grails
* sdk install grails 2.2.0

### Uninstall Grails
* sdk uninstall grails 2.2.0


## Delete

* Remove the sdkman lines at the end of the following files:
 * .bashrc
 * .bash_profile
 * .profile

* Finally delete the ‘~/.gvm’ or  ‘~/.sdkman folder
