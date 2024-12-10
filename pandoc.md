## Setup
### Ubuntu
```
# sudo dpkg --configure -a # may need to do this first?
apt-get install texlive
# OR
sudo apt-get install texlive-full
sudo apt-get install pandoc
```
### Mac OS X
```
brew cask install mactex texmaker
# OR if you want latex slimmed down...
brew cask install basictex
brew install pandoc
```
* Note if pandoc can't find pdflatex or other latex packages after installing mactex
  * Then try open a new terminal to re-init the path
  * Or start the tex utility in applications and go into a new terminal


## My Latex Template
```
pandoc -D latex > myTemplate.tex
```
