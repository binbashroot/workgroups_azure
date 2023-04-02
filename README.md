Deploy Terraform Plan With Ansible
=========

This project will deploy a Terraform plan that will create three (or more) Azure Linux VMs running RHEL 9.x to assist in studying for the RHCSA or RHCE certifcations.  Once provisioned, the hosts will be configured as a lab with objectives to help you learn how to perform tasks with RHEL.

Requirements
------------

collections:
- cloud.terraform
- azure.azcolleciton 
- ansible.posix

Environmental Variables
- ARM_SUBSCRIPTION_ID=""
- ARM_TENANT_ID=""
- ARM_CLIENT_ID=""
- ARM_CLIENT_SECRET=""
- ARM_SKIP_PROVIDER_REGISTRATION=true

Dependencies
------------

Terraform 1.4.4

Optional Variables
----------------

|Name|Type|Required|Default|Choices|
|:---|---|---|---|---|
|azure_location|string|yes|-|-|
|azure_resource_group|string|yes|-|-|
|rhpds_ssh_private_key_path|string|yes|-|-|
|rhpds_ssh_public_key_path|string|yes|"{{ rhpds_ssh_private_key_path + '.pub' }}"|-|
|tf_project_dir|string|yes|terraform|-|
|vm_count|string|yes|'3'|-|
|workgroup|string|yes|-|{rhcsa|rhce}|



Example Syntax 
----------------
```

ansible-playbook -i inventory deploy_terraform_plan.yml -e workgroup=rhcsa

ansible-playbook -i inventory deploy_terraform_plan.yml -e workgroup=rhcsa -e vm_count=5

```

Playbook 
----------------
See playbook [here](deploy_terraform_plan.yml)

License
-------

GPLv3

Author Information
------------------

Randy Romero <randy.romero@redhat.com>   
Michael DiDato <mdidato@redhat.com>


