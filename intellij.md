# intelliJ

## Install & update in Ubuntu
* https://www.jetbrains.com/help/idea/update.html
* https://www.jetbrains.com/help/idea/installation-guide.html
```
sudo snap install intellij-idea-ultimate --classic
sudo snap refresh intellij-idea-ultimate
```
## Keyboard Shortcuts
* https://resources.jetbrains.com/storage/products/intellij-idea/docs/IntelliJIDEA_ReferenceCard.pdf

## Windows: Use Git bash terminal in intellij
* Navigate: File - Settings - Terminal
* Add the following to "Shell path": "C:\Program Files\Git\git-bash.exe" --cd="C:/Users/\<path to project directory\>"

## Resolving Merge Conflicts
* First pull the changes into your repo resulting in a merging state
* Open IntelliJ and navigate to the "Version Control" tab at the bottom of the app
  * Click on Local Changes
    * Click on Resolve
      * Double Click the file you want to resolve
* The left screen is the local version that was on your computer
* The middle screen is the result of your merging activities
* The right screen is the version you pulled from the repository
* https://www.jetbrains.com/help/idea/resolving-conflicts.html

# Update IntelliJ launcher on Ubuntu
* Edit /usr/share/applications/jetbrains-idea.desktop
```
Icon=<path to icon>
Path=<path to bin directory>
```
* Reboot or login / logout

## Upgrade on linux
* Download newest version
* Unzip&Untar it
* Navigate to the bin folder and run .idea.sh from the command line
* Import settings from previous version
* Close intellij
* Move or delete old intellij software folder
* Delete hidden folder in your home directory starting with .IntelliJ<IDEA VERSION>
* Edit the following file:
 * sudo vim /usr/share/applications/jetbrains-idea.desktop
```
[Desktop Entry]
Version=1.0
Type=Application
Name=IntelliJ IDEA
Icon=/home/alexanderb/software/idea-IU-143.1821.5/bin/idea.png # EDIT THIS LINE!!!
Exec="/home/alexanderb/software/idea-IU-143.1821.5/bin/idea.sh" %f # EDIT THIS LINE!!!
Comment=Develop with pleasure!
Categories=Development;IDE;
Terminal=false
StartupWMClass=jetbrains-idea
```

### Checkstyle Setup
* Install CheckStyle-IDEA and restart IntelliJ
* Get a default checkstyle.xml from e.g.:
  * https://github.com/checkstyle/checkstyle/blob/master/src/main/resources/google_checks.xml
  * Note you can activate the sun and google checkstyles in intellij as they are there by default
* Edit the checkstyle.xml to suit you
* Add it to a repo somewhere
* Import into IntelliJ
  * Settings -> Other Settings -> Checkstyle
    * Make sure you have the correct "Checkstyle Version" for your file
    * Click on + sign
    * Add description and select file from path or URL
    * Click finish
  * Click on box to make the checkstyle active
* Click Apply or OK  

## Codestyle Setup
* IntelliJ
  * Settings -> Editor -> Code Style -> Java
    * Scheme -> Click on Cog -> Import Scheme
      * IntelliJ IDEA code style xml
        * Add file xml
    * Select scheme in drop down, apply or click ok    


## Howto setup karma tests
* Install plugin called "Karma"
* Go to...
 * Run
  * Edit Configurations
   * Edit the Karma configurations
    * Configuration file - karma.conf.js
    * Node interpreter - /usr/local/bin/node
    * Karma package - the karma folder in your node_modules directory
