# CustomCloud

## Usage
0. Initialisation of the playbooks
- Setup your local SSH public key inside group_vars/all/vars
```
users:
  user1:
    ssh_key: "ssh-rsa AAAAB3NzaC1yc2EA[...]"
  user2: ...
```

- Setup your custom inventory with one host named KVMHost and any number of VM
- Setup your VM configurations based on template group_vars/all/vm100.yml

1. Initialisation of KVM Host (only Debian 8 certified)

```
wget https://raw.githubusercontent.com/BastienF/CustomCloud/master/init-ansible-debian.sh
./init-ansible-debian.sh
ansible-playbook -i inventory.prod host_post_install.yml
```

2. Creation of a VM

```
ansible-playbook -i inventory.prod vm_create.yml -l host,vm100
```