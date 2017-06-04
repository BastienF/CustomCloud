# CustomCloud

## Usage
### Initialisation
#### Initialisation of the playbooks
- Setup your local SSH public key inside group_vars/all/vars
```
users:
  user1:
    ssh_key: "ssh-rsa AAAAB3NzaC1yc2EA[...]"
  user2: ...
```

- Setup your custom inventory with one host named KVMHost and any number of VM
- Setup your VM configurations based on template group_vars/all/vm100.yml

#### Setup of development environment
The development environnement use [Vagrant](https://www.vagrantup.com/).

To setup dev env :
- Download and install Vagrant
- Run from ./dev_env : `vagrant up`

To stop or destroy dev env :
- Run from ./dev_env : `vagrant stop` or `vagrant destroy`

### Cloud configuration
1. Initialisation of KVM Host (only Ubuntu server 16.04 certified)

```
wget https://raw.githubusercontent.com/BastienF/CustomCloud/master/init-ansible-debian.sh
./init-ansible-debian.sh
ansible-playbook -i inventory.dev host_post_install.yml
```

2. Creation of a VM

```
ansible-playbook -i inventory.dev vm_create.yml -l host,vm100
```

3. Setup of a VM

```
ansible-playbook -i inventory.dev vm_post_install.yml -l host,vm100
```

4. Update of VM exposed ports
```
ansible-playbook -i inventory.dev vm_refresh_exposed_ports.yml -l host,vm100
```

4. VM destroying
```
ansible-playbook -i inventory.dev vm_erase.yml -l host,vm100
```
To completely erase VM and associated data use `erase_data_disk` option :
```
ansible-playbook -i inventory.dev vm_erase.yml -e erase_data_disk=true -l host,vm100
```