== Mermaid

=== Compile Mermaid from the CLI
* If you want to compile and convert ALL TYPES of mermaid diagrams then do the following
* Unfortunately, github and intellij don't support mermaidjs kanban boards currently
* https://github.com/mermaid-js/mermaid

*Example Setup*

[source,bash]
....
# Make sure google chrome is intalled
export CHROME_DEVEL_SANDBOX=/opt/google/chrome/chrome-sandbox

nvm ls-remote
nvm install <latest LTS stable version>
nvm use <LTS version installed above>
npm i @mermaid-js/mermaid-cli # you can add -g to make it global
npm i -g @mermaid-js/mermaid-cli # this will install "globally" into your nvm versions folder and not globally on the system
# Beware if you change the nvm version the global app will no longer "exist"
mmdc -i diagram.mmd -o diagram.svg
....