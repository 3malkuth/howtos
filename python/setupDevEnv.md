# Python

## How to setup your python project the right way...
Author: Jean-Paul Calderone
Website: https://jcalderone.livejournal.com/39794.html

### Do:
* name the directory something related to your project. For example, if your project is named "Twisted", name the top-level directory for its source files Twisted. When you do releases, you should include a version number suffix: Twisted-2.5.
* create a directory Twisted/bin and put your executables there, if you have any. Don't give them a .py extension, even if they are Python source files. Don't put any code in them except an import of and call to a main function defined somewhere else in your projects. (Slight wrinkle: since on Windows, the interpreter is selected by the file extension, your Windows users actually do want the .py extension. So, when you package for Windows, you may want to add it. Unfortunately there's no easy distutils trick that I know of to automate this process. Considering that on POSIX the .py extension is a only a wart, whereas on Windows the lack is an actual bug, if your userbase includes Windows users, you may want to opt to just have the .py extension everywhere.)
* If your project is expressable as a single Python source file, then put it into the directory and name it something related to your project. For example, Twisted/twisted.py. If you need multiple source files, create a package instead (Twisted/twisted/, with an empty Twisted/twisted/__init__.py) and place your source files in it. For example, Twisted/twisted/internet.py.
* put your unit tests in a sub-package of your package (note - this means that the single Python source file option above was a trick - you always need at least one other file for your unit tests). For example, Twisted/twisted/test/. Of course, make it a package with Twisted/twisted/test/__init__.py. Place tests in files like Twisted/twisted/test/test_internet.py.
* add Twisted/README and Twisted/setup.py to explain and install your software, respectively, if you're feeling nice.

### Don't:
* put your source in a directory called src or lib. This makes it hard to run without installing.
* put your tests outside of your Python package. This makes it hard to run the tests against an installed version.
* create a package that only has a __init__.py and then put all your code into __init__.py. Just make a module instead of a package, it's simpler.
* try to come up with magical hacks to make Python able to import your module or package without having the user add the directory containing it to their import path (either via PYTHONPATH or some other mechanism). You will not correctly handle all cases and users will get angry at you when your software doesn't work in their environment.

## Setup Python Dev Environment
* Install Python
```
# Installing Python
sudo apt-get update && sudo apt get upgrade
sudo apt install python3
sudo apt upgrade python3
sudo apt update && sudo apt install python3-pip
python3 -m pip install --user --upgrade pip
sudo apt-get install build-essential libssl-dev libffi-dev python-dev
```
* Setup virtual environment using pipenv
```
pip3 install pipenv
mkdir my_project
cd my_project
pipenv shell
pipenv install **package_name**
pipenv graph # tells you what packages are installed
pipenv upgrade **package_name**
# NOTE: commit the Pipfile cretaed in order to manage dependencies
```

* Setup virtual python dev environment - DON'T USE THIS AS BREAKS IF UPDATE SYSTEM PYTHON
```
sudo apt-get install -y python3-venv
cd ~
mkdir environments
cd environments
python3 -m venv my_project_env # isolated python project space
source my_project_env/bin/activate # activates space in the current terminal
deactivate # deactivates project space

python3 -mvenv --upgrade path/to/venv # if you need to upgrade
```
  * References
    * https://linoxide.com/linux-how-to/setup-python-virtual-environment-ubuntu/

## Using pipenv
```
pip3 install pipenv
mkdir my_project
cd my_project
pipenv shell # creates virtual environment for you
pipenv install **package_name**
pipenv install **package_name** --dev # developer package
pipenv uninstall **paackage name**
pipenv lock # creates the lock file
deactivate # closes the shell
```

## Using Pip
```
pip3 install -r requirements.txt
pip3 install scrapy==1.5 #package name and version

pip3 list

pip3 install --upgrade package_name
pip3 uninstall package_name
pipenv install --dev pytest
```

## Setup virtualenv
```
sudo apt install -y python3-venv # or pip install virtualenv
mkdir testDir
cd testDir
python3 -m venv env1
source env1/bin/activate
python -m pip module_name # to install things specific for this venv
python -m pip freeze > requirements.txt
python -m pip install -r requirements.txt # if you have a requirements file...
python program_name.py # python will be the venv python
deactivate
```

## Troubleshooting
* Module can't be found even though its seems to be installed (in pip freeze etc.)
```
/home/user/.virtualenvs/scripts/bin/python -m pip install module_name
```
