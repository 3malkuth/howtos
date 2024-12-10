#Setting up SSH Private & Public Keys

##SSH 2
* On the machine you want to SSH from (local machine) type
```
$ ssh-keygen -t rsa #simply press enter several times..
$ ssh-keygen -t dsa #Note dsa is deprecated by default in openshh version 7!!!!
````

Copy the content of the file:
~/.ssh/id_rsa.pub OR ~/.ssh/id_dsa.pub
to
~/.ssh/authorized_keys (on the remote host)

SSH into the remote machine from the local machine.
On the local machine you need to be the user that created the key.
You need to ssh as follows:
ssh remote_user@remote_machine
Where the remote_user is the user that has the ssh key in its~/.ssh/authorized_keys file

#FAQ
Q: I still get asked for the password when I try to ssh into the remote machine
A: You may need to check the permissions of the .ssh directories (chmod 700 ~/.ssh)

#References
* http://www.ece.uci.edu/~chou/ssh-key.html
