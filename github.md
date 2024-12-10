# github.com

## HTTPS DNS
* https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site

* https://docs.github.com/en/pages/getting-started-with-github-pages/securing-your-github-pages-site-with-https

## Multiple github accounts on single machine
Reference:  
* https://www.freecodecamp.org/news/manage-multiple-github-accounts-the-ssh-way-2dadc30ccaca/

### ssh keys
```
ssh-keygen -t rsa -C "email@example.com" -f id_rsa_unique_identifier
```

### Register keys with the ssh agent
```
eval "$(ssh-agent -s)" # check the agent is running
ssh-add ~/.ssh/id_rsa_unique_identifier
```

### config file
* vim ~/.ssh/config
```
# git_profile
Host git_profile.github.com
   HostName github.com # Exclude this line if using a self hosted gitlab
   User git
   IdentityFile ~/.ssh/id_rsa_unique_identifier
```

### Usage
```
git clone git@git_profile.github.com:git_profile/repo.git
cd repo
git config user.name "github user"
git config user.email "email@example.com"
```

