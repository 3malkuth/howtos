# git-svn

## Clone Repository
```
git svn clone http://svn.example.com/project -T trunk -b branches -t tags
git svn clone http://svn.example.com/project --stdlayout

```
* https://stackoverflow.com/questions/3239759/checkout-remote-branch-using-git-svn

## Clone a Specific Branch
```
git svn clone -T branches/somefeature http://example.com/PROJECT
```
* https://gist.github.com/trodrigues/1023167
