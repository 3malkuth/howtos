#Ansible Howto

##Installation
* Ubuntu
 * sudo apt-get install ansible

##Directory Structure
$ mkdir ~/playbook

##Inventory File
* Ansible needs to know about the servers you want to maintain
* This information is stored in the "inventory" file
* It is best to ensure the necessary ssh key pairs have been setup
* Assume the name of the server will be "server0002" and the username "srvadmin"
$ cd ~/playbook
$ vim inventory
```
server0002 ansible_ssh_host=192.168.1.8 ansible_ssh_port=22
ansible_ssh_user=srvadmin
ansible_ssh_private_key_file=~/.ssh/id_dsa
```

* Test that the connection works
$ ansible server0002 -i inventory -m ping
* You should see the following result
```
server0002 | success >> {
    "changed": false, 
    "ping": "pong"
}
```


##References
* http://www.ansible.com/ansible-book
