Deploy Terraform Plan With Ansible
=========

This project will deploy a Terraform plan that will create three (or more) Azure Linux VMs running RHEL 9.x to assist in studying for the RHCSA or RHCE certifcations.  
Once provisioned, the hosts will be configured as a lab with objectives to help you learn how to perform tasks with RHEL. The labs are ungraded and are only a tool to help you develop your skills. 


**NOTE:**  
- RHCSA Practice Labs are currently under development   
- RHCE Practice Labs are pending development  

Instance Builds
------------
|Instance|VM Instance Name|Use Case|
|:---|---|---|
|0|rhsca-vm-0|NFS Service for Instance #1|
|1|rhsca-vm-1|Practice Lab Instance|
|2|rhsca-vm-2|RHEL Media Repo/Practice Lab Instance|
|3 (or higher)|rhsca-vm-3|Generic Miscellaneous Use|

|Instance|VM Instance Name|Use Case|
|:---|---|---|
|0|rhce-vm-0|Ansible Controller|
|1|rhce-vm-1|Practice Lab Instance|
|2|rhce-vm-2|Practicee Lab Instance|
|3 (or higher)|rhce-vm-3|Generic Miscellaneous Use|


***
Requirements
------------

>**Collections:**
>- cloud.terraform
>- azure.azcolleciton 
>- ansible.posix
>
>**Environment:**
>- ARM_SUBSCRIPTION_ID=""
>- ARM_TENANT_ID=""
>- ARM_CLIENT_ID=""
>- ARM_CLIENT_SECRET=""
>- ARM_SKIP_PROVIDER_REGISTRATION=true
>
>**SSH:**
>- An "rsa" ssh key must be created
>- Ssh key namne must be 'id_rsa_rhpds' 
>- Ssh key must reside in your user's home .ssh directory
>- Provisions hosts only allow pubkey authentication for connectivity

Dependencies
------------
>- Terraform >= 1.4.4
>- Ansible >=2.12


Variables
----------------

>|Name|Type|Required|Default|Choices|
>|:---|---|---|---|---|
>|azure_location|string|yes|-|-|
>|azure_resource_group|string|yes|-|-|
>|rhpds_ssh_private_key_path|string|yes|-|-|
>|rhpds_ssh_public_key_path|string|yes|"{{ rhpds_ssh_private_key_path + '.pub' }}"|-|
>|tf_project_dir|string|yes|terraform|-|
>|vm_count|string|yes|'3'|-|
>|workgroup|string|yes|-|{rhcsa\|rhce}|


Example Syntax 
----------------
```
ansible-playbook -i inventory deploy_terraform_plan.yml -e workgroup=rhcsa

ansible-playbook -i inventory deploy_terraform_plan.yml -e workgroup=rhcsa -e vm_count=5
```

Playbook 
----------------
See playbook [here](deploy_terraform_plan.yml)

Troubleshooting
----------------

|Symptom|Fix|
|:---|---|
| Practice Lab Tasks Unreachable|Log in via ssh as  the "student" user to the reposerver and run: <br>podman restart madness|
| deploy_terraform_plan.yml playbook fails| Rerun playbook |
| Determine your host's public IPs| ansible-inventory -i inventory --list \|grep ansible_host |

License
-------

GPLv3

Author Information
------------------

Randy Romero <randy.romero@redhat.com>   
Michael DiDato <mdidato@redhat.com>
Matt Willis <mawillis@redhat.com>

