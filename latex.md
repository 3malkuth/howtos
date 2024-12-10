# Latex

## Install
### Ubuntu
```
# sudo dpkg --configure -a # may need to do this first?
sudo apt-get install texlive
# OR
sudo apt-get install texlive-full # USE THIS ONE!!!!! Even though it takes forever...
```
### Mac OS X
```
brew cask install mactex texmaker
# OR if you want latex slimmed down...
brew cask install basictex
```
## Editor
* If you want to use the editor that comes with tex
  * Install the following package
```
sudo apt-get install texstudio
```

## Manage Fonts
### Ubuntu
```
# List System fonts
sudo apt-get install fontconfig
fc-list
# List Tex-live fonts
find /usr/share/texlive/texmf-dist/tex/latex -name '*.fd' | xargs grep '\\DeclareFontFamily' | sed 's#.*\\DeclareFontFamily{\([a-zA-Z0-9]*\)}{\([a-zA-Z0-9]*\)}.*#  \1    \2#'
```
* https://www.tug.org/fonts/fontinstall.html

## Install non-free fonts
### Ubuntu
#### Install
```
wget https://www.tug.org/fonts/getnonfreefonts/install-getnonfreefonts
texlua install-getnonfreefonts
```
### Mac OS X
```
curl --remote-name https://www.tug.org/fonts/getnonfreefonts/install-getnonfreefonts
texlua install-getnonfreefonts
```
#### Usage
```
getnonfreefonts --sys --help
getnonfreefonts --sys [other arguments]
getnonfreefonts --user [other arguments]

```
#### List of font packages supported
* http://www.tug.org/fonts/getnonfreefonts/

#### Check for new fonts or updates
```
getnonfreefonts[-sys] --lsfonts
```

#### Install custom fonts
* https://www.tug.org/fonts/fontinstall.html


## References
* http://www.tug.dk/FontCatalogue
* https://tex.stackexchange.com/questions/23957/how-to-set-font-to-arial-throughout-the-entire-document
* https://ctan.org/tex-archive/fonts/urw/arial/
* https://github.com/timfel/texmf/blob/master/arial/arial/README.arial
