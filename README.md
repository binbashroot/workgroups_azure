Deploy Azure RHPD For Workgroups Using Ansible
=========

## THIS CODE IS SELF-SUPPORT. ASK QUESTIONS IN THE RHCSA/RHCE WORKGROUP CHAT.

This project will deploy a Terraform plan that will create three (or more) Azure Linux VMs running RHEL 9.x to assist in studying for the RHCSA or RHCE certifcations.  
Once provisioned, the hosts will be configured as a lab with objectives to help you learn how to perform tasks with RHEL. The labs are ungraded and are only a tool to help you develop your skills. 

**NOTE:**  
- RHCSA Practice Labs are currently under development   
- RHCE Practice Labs are pending development  

Instance Builds
------------
|Instance|VM Instance Name|Use Case|
|:---|---|---|
|0|rhsca-vm-0|NFS Service for Node #1|
|1|rhsca-vm-1|Practice Lab Node|
|2|rhsca-vm-2|RHEL Media Repo/Lab Node|
|3(or higher)|rhsca-vm-?|Generic Node|

|Instance|VM Instance Name|Use Case|
|:---|---|---|
|0|rhce-vm-0|Ansible Controller|
|1|rhce-vm-1|Practice Node|
|2|rhce-vm-2|Practicee Node|
|3|rhce-vm-3|Practice Node|
|4|rhce-vm-4|Practicee Node|
|5(or higher)|rhce-vm-?|Practice Node|


Requirements
------------

**Collections:**
>- cloud.terraform
>- azure.azcollection 
>- ansible.posix

Dependencies
------------
>- Terraform >= 1.4.4
>- Ansible >=2.13

Variables
----------------
>|Name|Type|Required|Default|Choices|
>|:---|---|---|---|---|
>|azure_location|string|yes|-|-|
>|azure_resource_group|string|yes|-|-|
>|rhpds_ssh_private_key_path|string|yes|-|-|
>|rhpds_ssh_public_key_path|string|yes|"{{ rhpds_ssh_private_key_path + '.pub' }}"|-|
>|tf_project_dir|string|yes|terraform|-|
>|vm_count|string|yes|'{3\|5}'|-|
>|workgroup|string|yes|-|{rhcsa\|rhce}|
>|allow_all_ssh|boolean|no|-|  
>|only_tf|boolean|no|-|  

Example Syntax 
----------------
```
Provisions a lab for RHCSA practice.  This is the default and only allows ssh from your public IP
ansible-playbook -i inventory deploy_terraform_plan.yml -e workgroup=rhcsa

Provisions a lab for RHCSA practice but opens ssh port to the world
ansible-playbook -i inventory deploy_terraform_plan.yml -e workgroup=rhce -e allow_all_ssh=true

Only peforms runs the terraform plan. Hosts are left untouched
ansible-playbook -i inventory deploy_terraform_plan.yml -e workgroup=rhcsa -e only_tf=true


Provisions a lab for RHCE practice
ansible-playbook -i inventory deploy_terraform_plan.yml -e workgroup=rhce 

ansible-playbook -i inventory deploy_terraform_plan.yml -e workgroup=rhce -e allow_all_ssh=true


Provisions a lab with no practice configurations
ansible-playbook -i inventory deploy_terraform_plan.yml -e workgroup=rhcsa -e tf_only=true

Tears down an existing lab

ansible-playbook -i inventory DESTROY_TERRAFORM_BUILD.yml -e workgroup=rhcsa -e tf_only=true


```

Playbook 
----------------
See playbook [here](deploy_terraform_plan.yml)

Quick Start Documentation 
----------------
Red Hat [Quick Start](docs/rhel_instructions.md)  
MacOS [Quick Start](docs/macos_instructions.md)  

License
-------

GPLv3

Author Information
------------------

Randy Romero <randy.romero@redhat.com>   
Michael DiDato <mdidato@redhat.com>
Matt Willis <mawillis@redhat.com>

