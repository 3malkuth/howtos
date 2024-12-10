# Git

## Clean
```
git rest --hard HEAD
git clean -xfd
```

## Table of Contents
* [Installing Git](#installing-git)
* [Git Setup](#git-setup)
* [Git Help](#git-help)
* [Git Basics](#git-basics)

## NB! Rebasing!
* Always use rebasing!
```
git checkout <branch name>
git rebase master
git push -f
git pull --rebase
```

## Installing Git
* https://git-scm.com/book/en/v2/Getting-Started-Installing-Git

## Setup to show git branch in linux shell
* Add the following code to the end of .bashrc
* Reference: https://askubuntu.com/questions/730754/how-do-i-show-the-git-branch-with-colours-in-bash-prompt
```
# Show git branch name
force_color_prompt=yes
color_prompt=yes
parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
if [ "$color_prompt" = yes ]; then
 PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '
else
 PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
fi
unset color_prompt force_color_prompt
```

## Using different ssh keys with for different github accounts
```
ssh-keygen -t rsa -C "email_address@example.com"
ssh-add ~/.ssh/id_rsa_alt
ssh-add -l # List cached keys (-D to delete cached keys)
vim ~/.ssh/config
##################################
# default
Host github.com
   HostName github.com
   User git
   IdentityFile ~/.ssh/id_rsa

# alt
Host github.com-alt
   HostName github.com
   User git
   IdentityFile ~/.ssh/id_rsa_alt
##################################

cd local_repo

git config user.name "alt"
git config user.email "alt@example.com"

vim .git/config
##################################
[remote "origin"]
        url = git@github.com-alt:alt/some.git
        fetch = +refs/heads/*:refs/remotes/origin/*
##################################        
```
Reference:  
* https://gist.github.com/jexchan/2351996

## Single local branch and 2 remote repos
```
cd repo1
git checkout -b branch1 origin/branch1
git remote add repo2 https://githost/repo2.git

# TO MERGE into current branch
git pull repo2 branch2

git push -u origin branch1
git push -u repo2 branch2
```

## Merge two branches from two repos
* First of all decide which repo you want to work in and cd into it
```
cd repo1
git checkout -b branch1 origin/branch1
git remote add repo2 https://githost/repo2.git

# TO MERGE into current branch
git pull repo2 branch2

git push -u origin branch1
git push -u repo2 branch2

```


## Managing branches
```
git checkout -b <branch-name> # checkout branches
git push -u origin <branch-name>

# Checkout existing branch on remote repo
git fetch
git branch -v -a # shows all branches that can be checked out
git checkout <branch-name>
```
* Old notes
```
$ git fetch # pulls branches on the remote repo
$ git branch # lists all branches
$ git checkout [branch-name] # switches to specified branch

$ git checkout -b [branch-name] origin/branch-name # GOOD: checkout branch from remote repository and link it to remote branch-name!!!!
$ git checkout -b [branch-name] origin # BAD: checkout branch from remote repository and link it to remote MASTER!!!! 

$ git checkout -b [branch-name-new] [branch-name-old] # to create a new branch from another existing branch
$ git push origin [branch-name-new] # do this to create the branch on github
```
* Diff between two branches
 * http://stackoverflow.com/questions/9834689/comparing-two-branches-in-git

## Git Setup
```
# System wide
$ git config --system
$ sudo vim /etc/gitconfig

# User
$ git config --global
$ vim ~/.config/git/config or ~/.gitconfig

# Repository
$ git config # user.email / user.name etc.
$ vim .git/config

# Typical Commands
$ git config user.name "John Doe"
$ git config user.email johndoe@example.com
$ git config core.editor emacs

# Check your settings
$ git config --list
```

## Git Help
```
# These three commands do the same things
$ git help
$ git <git command> --help
$ man git-<git command>

# Example
$ git help config # provides manpage for the config files
```

## Git Basics
```
$ git init # Initilize a repo in a directory
$ git add *.c # add all files ending with extension ".c" to staging
$ git add <FILENAME> # add specific file to staging
$ git commit -m 'a message about this snapshot'
$ git clone <URL> # clone respository into current directory
```

## Changes to Repo
* TODO
  * https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository




# OLD STUFF


## .gitignore
* Standard glob patterns
  * https://en.wikipedia.org/wiki/Glob_(programming)
```
# no .a files
*.a

# but do track lib.a, even though you're ignoring .a files above
!lib.a

# only ignore the TODO file in the current directory, not subdir/TODO
/TODO

# ignore all files in the build/ directory
build/

# ignore doc/notes.txt, but not doc/server/arch.txt
doc/*.txt

# ignore all .pdf files in the doc/ directory and any of its subdirectories
doc/**/*.pdf
```

## Remove files from git
```
# Standard removal of file
$ git rm README # removes local copy and stages removal from git
$ git commit -m "removed readme"

$ git rm log/\*.log # This command removes all files that have the .log extension in the log/ directory.
$ git rm \*~ # This command removes all files whose names end with a ~.

# If you added a file by accident to git and want to ignore it do the following
$ git rm --cached README # keeps local copy, but removes from git
```

## Move file
```
$ git mv README.md README
# Same as
$ mv README.md README
$ git rm README.md
$ git add README
```

### Standard local repository settings
```
$ git config user.name "tripattern"
$ git config user.email "systems@trip.com"
$ git config push.default matching
$ git config core.editor "vim"
```

## Git Basics
```
$ git init # create a local repository in a folder
$ git status # status of the files in the local repo
$ git add <filename> # track/stage an untracked file - prep file for next commit
$ git add '*.txt' # track/stage all changed text files also use for files you have done the merging on
$ git commit -m 'commit message' # commit files that are being tracked /have been staged with a message
$ git commit -a -m "comment" # adds all changed files and commits (skips add step)
$ git log # look at a log of your commits
$ git remote add origin https://github.com/try-git/try_git.git # link local repo to remote repo at given url and name it 'origin'
$ git push -u origin master # push local commits in master branch to origin (remote repo)
# Note the -u parameter helps git remember the branch and repo settings so the next time you can just run git push pr pull
# Note destination first, branch second
$ git pull --all # pulls all branches and creates local ones tracking remotes
# http://stackoverflow.com/questions/10312521/how-to-fetch-all-git-branches
$ git fetch --all # updates local copies
$ git branch -a # look at all branches, but if you want to check out branches u don't have locally do the following...
$ git checkout -b experimental origin/experimental # http://stackoverflow.com/questions/67699/how-to-clone-all-remote-branches-in-git
$ git pull -u origin master # pulls from origin (remote repo) into the master branch
$ git diff HEAD # say someone has added code to the remote repo and you have pulled the latest changes from the remote repo
# ... then you can check what has changed from your last commit by using this command
$ git diff --staged # allows you to see the changes to the files that have been staged for commit
$ git reset <filename> # this will unstage the filename from the next commit
$ git checkout -- <filename> # This will revert a file back to the state it was in at the last commit
$ git branch # shows list of branches
$ git branch <new branch name> # create a branch from the existing branch
$ git checkout <branch name> # start using another branch
$ git rm '*.txt' # remove these files from the local disk and stage them to be removed from the repo in the next commit/push
$ git clone --depth=14 https://github.com/angular/angular.git # downloads remote repo, --depth only downloads last 14 commits

# Merging a branch into a another branch
$ git branch master # this will put you in branch master, but could be any branch
$ git merge <branch name> # this will merge changes in your branch name into the current branch you are using

$ git branch -d <branch name> # deletes a branch
$ git push # pushes deletion to the remote repo as well
```

### Simple Bash script for updating sub-folders
```
#!/bin/bash
ls -d */.git | while read subfolder ; do (
  cd "${subfolder%%.git}"
  pwd
  git pull
  git reset --hard HEAD
 ) ; done
```

## Diffs
```
$ git diff # shows UNSTAGED changes
$ git diff --staged # shows STAGED changes
```

### Reset and store credentials
```
$ vim ~/.netrc
###
machine example.com login USER password PASSWORD
###
# INSECURE METHOD!!!!! NASTY!!!
# http://stackoverflow.com/questions/28104581/how-secure-is-storing-password-with-git/28104587#28104587
$ git config credential.helper store
# Then run a push or pull command...
# More info:
$ git credential-store --help
```

### Changes
#### Reverting changes in branch back to previous commit
```
$ git reset --hard HEAD
$ git checkout -b old-state 0d1d7fc32 # this will create a branch with the old version in it
$ git checkout 0d1d7fc32 # THIS IS BAD! Rather do the example above! This will detach your HEAD and leave you without a branch that is checked out
```
#### Destroy previous commit without losing changes to yout files
```
$ git reset --soft # doesn't seem to always work???
$ git reset HEAD~2 --soft # will go back 2 commits  
```

#### Deleting file from git
```
$ git rm <filename> # deletes local copy and stages delete for next commit on remote repo
$ git rm --cached <filename> # stages file for deletion from remote repo
$ git rm --cached -r <directory> # stages folder for deletion from remote repo
```

#### revert branch back to a certain commit and then commit that branch so it becomes the current version
```
$ git revert --no-commit 0766c053..HEAD
$ git commit
```

#### file back to previous commit and restore again
```
This one is hard to find out there so here it is. If you have an uncommitted change (its only in your working copy) that you wish to revert (in SVN terms) to the copy in your latest commit, do the following:

git checkout filename

This will checkout the file from HEAD, overwriting your change. This command is also used to checkout branches, and you could happen to have a file with the same name as a branch. All is not lost, you will simply need to type:

git checkout -- filename

You can also do this with files from other branches, and such. man git-checkout has the details.

The rest of the Internet will tell you to use git reset --hard, but this resets all uncommitted changes you’ve made in your working copy. Type this with care.

```

### Deleting a local branch that was deleted remotely
```
$ git fetch --prune
$ git branch -d the_local_branch_name
```

## Git Stash
"Stashing takes the dirty state of your working directory  
— that is, your modified tracked files and staged changes  
— and saves it on a stack of unfinished changes that you can reapply at any time."  
quote from https://git-scm.com/book/no-nb/v1/Git-Tools-Stashing
```
$ git stash # stashes the local changes
$ git stash pop # puts back the local changes
$ git stash apply stash@{2}
$ git stash drop # deletes the last stash
$ git stash list
$ git stash branch testchanges
```

### Difference between default matching and simple
```
git push can push all branches or a single one dependent on this configuration:

Push all branches

git config push.default matching
It will push all the branches to the remote branch and would merge them. If you don't want to push all branches, you can push the current branch only.

Push only the current branch

git config push.default simple
So, it's better, in my opnion, to use this option and push your code branch by branch. It's better to push branches manually and individually.

Reference: http://stackoverflow.com/questions/21839651/git-what-is-the-difference-between-push-default-matching-and-simple
```

### The recommended way of deploying the dist directory is using git subtree.
*Remove the dist directory from the .gitignore file.
* Add the dist directory to your repository and commit it with your project.
 * git add -f dist && git commit -m "Initial dist subtree commit" # -f is used if the folder is in your .gitignore file
* Once the dist directory is part of your project we can use git subtree to set up a separate repository on a different branch. Note: prefix must be the relative path to your dist directory. This is assuming dist is in your root directory.
 * git subtree push --prefix dist origin gh-pages
* Now you can commit to your entire repository in your default (master) branch and whenever you want to deploy the dist directory you can run:
 * git subtree push --prefix dist origin gh-pages

## Windows specific

### warning: LF will be replaced by CRLF in
* If you get this error message do this...
```
$ git config core.autocrlf false
```


## References
### Github
* https://help.github.com/articles/good-resources-for-learning-git-and-github/
* https://training.github.com/kit/downloads/github-git-cheat-sheet.pdf
* https://www.quora.com/How-can-I-export-backup-GitHub-issues
* Fix commits with wrong author
  * https://help.github.com/articles/changing-author-info/

### Git
* https://git-scm.com/
* http://pcottle.github.io/learnGitBranching/?demo
* https://try.github.io/

### Books
* https://git-scm.com/book/en/v2
* http://ftp.newartisans.com/pub/git.from.bottom.up.pdf

### Build a numbering system
* http://semver.org/
  * http://blog.ionic.io/ionic-3-0-has-arrived/ -example of semver in use... explained
* http://www.linfo.org/kernel_version_numbering.html
