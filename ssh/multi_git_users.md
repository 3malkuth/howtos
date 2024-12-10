# Multiple Git Users on the same system

* Generate Keys
```
ssh-keygen -t rsa -f file_name -C "email address"
```

* Update config file
```
cd ~/.ssh
vim config

###########################################
# additional github profile
Host config_profile_name.github.com
   HostName github.com
   User git
   IdentityFile ~/.ssh/id_rsa_generated_key
###########################################

```

* Go to github and add the public key to the ssh keys
* git clone the repo you want to use
```
git clone git@config_profile_name.github.com:github_profile_name/repo.git
```
* cd into the git repo directory
* Set the correct user name and email address for the repo
```
git config user.name "your_name"
git config user.email "your_email@example.com" 
```
