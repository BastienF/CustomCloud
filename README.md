# CustomCloud

## Usage
### Initialisation of the playbooks

- Setup your custom inventory (see inventories/inventory.yml.example)

- Setup your VM configurations in their host_vars or in broader group_vars,
  available parameters are:
  - `users`, a map that defines the initial users, of the form:
    ```
    users:
      user1:
        ssh_keys:
          - "ssh-rsa AAA[...]"
      .
      .
      .
    ```

- Setup ports redirection and VM storage (see group_vars/all for an example)

### Setup of development environment
The development environnement use [Vagrant](https://www.vagrantup.com/).

To setup dev env :
- Download and install Vagrant
- Run from ./dev_env : `vagrant up`

To stop or destroy dev env :
- Run from ./dev_env : `vagrant stop` or `vagrant destroy`

### Cloud configuration
1. Initialisation of the host (only Ubuntu server 16.04 certified)  
Make sure you access the host with a user with sudo rights
(see `init-ansible-debian.sh` for an example setup with the ansible user)  
Configure this user in ansible.cfg and run:
```
ansible-playbook -i inventories/dev.yml host_install.yml
```

2. Creation of a VM
```
ansible-playbook -i inventories/dev.yml vm_create.yml -l <your VM>
```

3. Setup of a VM
```
ansible-playbook -i inventories/dev.yml vm_install.yml -l <your VM>
```

4. Update of VM exposed ports
```
ansible-playbook -i inventories/dev.yml vm_refresh_exposed_ports.yml -l <your VM>
```

5. VM destroying
```
ansible-playbook -i inventories/dev.yml vm_erase.yml -l <your VM>
```
To completely erase VM and associated data use the `vm_erase_data_disk` option :
```
ansible-playbook -i inventories/dev.yml vm_erase.yml -e vm_erase_data_disk=true -l <your VM>
```
