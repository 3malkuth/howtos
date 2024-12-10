```
## ALEX VARIABLES AND ALIASES

export VISUAL=/usr/bin/vim
export EDITOR="$VISUAL"

alias mci='mvn clean install'
alias mcis='mvn clean install -DskipITs=false'
alias mcisTrue='mvn clean install -DskipITs=true'
alias mvnpdf='mvn clean install -Pdocgen-pdf'
alias mvnlatex='mvn -PlatexProfil clean process-resources latex:latex'
alias mvnlatexo='mvn -PlatexProfil clean process-resources latex:latex -o'
alias mvndebug='mvn clean install -Pdebugger'
alias mvndep='mvn clean install -Pserver-package-deploy'

alias l='ls -alh'
alias v='vim'
alias h='cd ~'
```
