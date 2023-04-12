Deploy Azure RHPD For Workgroups Using Ansible
=========

This project will deploy a Terraform plan that will create three (or more) Azure Linux VMs running RHEL 9.x to assist in studying for the RHCSA or RHCE certifcations.  
Once provisioned, the hosts will be configured as a lab with objectives to help you learn how to perform tasks with RHEL. The labs are ungraded and are only a tool to help you develop your skills. 

**NOTE:**  
- RHCSA Practice Labs are currently under development   
- RHCE Practice Labs are currently under development  
- OCP Practice Labs are pending development

Instance Builds
------------
#### RHCSA
|Instance|VM Instance Name|Use Case|
|:---|---|---|
|1|rhsca-vm-1|Control Server (NFS & MKDOCS)|
|2|rhsca-vm-2|Client Node most exercises are performed on|
|3|rhsca-vm-3|RHEL Media Repo & Lab Node(tbd)|
|4(or higher)|rhsca-vm-?|Additional Node if specified|

#### RHCE
|Instance|VM Instance Name|Use Case|
|:---|---|---|
|1|rhce-vm-1|Ansible Controller & MKDOCS |
|2|rhce-vm-2|Practice Node|
|3|rhce-vm-3|Practice Node|
|4|rhce-vm-4|Practice Node|
|5|rhce-vm-5|Practice Node|
|6(or higher)|rhce-vm-?|Practice Node if specified|

#### OCP
|Instance|VM Instance Name|Use Case|
|:---|---|---|
|1|ocp-vm-1|OCP Control & MKDOCS |
|2|ocp-vm-2|Practice Node|
|3|ocp-vm-3|Practice Node|
|4|ocp-vm-4|Practice Node|
|5(or higher)|ocp-vm-?|Practice Node if specified|

Requirements
------------

**Collections:**
>- cloud.terraform
>- azure.azcollection 
>- ansible.posix
>- community.general

Dependencies
------------
>- Terraform >= 1.4.4
>- Ansible >=2.13

Variables
----------------
| Name                       | Type    | Required | Default                          | Choices           | Notes                                                                                          |
|----------------------------|---------|----------|----------------------------------|-------------------|------------------------------------------------------------------------------------------------|
| azure_location             | string  | yes      | -                                | -                 | -                                                                                              |
| azure_resource_group       | string  | yes      | -                                | -                 | -                                                                                              |
| rhpds_ssh_private_key_path | string  | yes      | {{ rhpds_ssh_private_key_path }} | -                 | -                                                                                              |
| tf_project_dir             | string  | yes      | terraform/{{ workgroup }}        | -                 | -                                                                                              |
| vm_count                   | string  | yes      | See Notes                        | -                 | RHCSA=3  RHCE=5  OCP=4                                                                         |
| workgroup                  | string  | yes      | -                                | {RHCSA\|RHCE\|OCP} | -                                                                                              |
| allow_all_ssh              | boolean | no       | -                                | -                 | Allows you to open up ssh acls to the full internet instead of just the ip you're coming from. |
| only_tf                    | boolean | no       | -                                | true\|false       | Only peforms Terraform build of infrastructure.  No  post provision tasks are performed.       |

Example Syntax 
----------------
```bash
#Provisions a lab for practice.  This is the default and only allows ssh from your public IP.  Lab choices are {rhcsa|rhce|ocp}.

# Provisions a lab for RHCSA practice but only opens ssh to the
# public IP of the host that ran the playbook 
$ ansible-playbook -i inventory deploy_terraform_plan.yml -e workgroup=rhcsa

# Provisions a lab for RHCE practice but opens ssh port everyone
$ ansible-playbook -i inventory deploy_terraform_plan.yml -e workgroup=rhce -e allow_all_ssh=true

# Only provisions hosts in the terraform plan. Hosts are left untouched
$ ansible-playbook -i inventory deploy_terraform_plan.yml -e workgroup=rhcsa -e only_tf=true

# Tears down an existing lab
$ ansible-playbook -i inventory DESTROY_TERRAFORM_BUILD.yml -e workgroup=rhcsa -e tf_only=true


```

Playbook 
----------------
See playbook [here](deploy_terraform_plan.yml)

Quick Start Documentation 
----------------
Red Hat [Quick Start](docs/rhel_instructions.md)  
MacOS [Quick Start](docs/macos_instructions.md)  

Technial Support 
----------------
Technical support is primarily self-support. Limited support is best effort and can only be requesed in the Workgroup chat rooms.  Bugfixes and Feature requests can go through the internal Gitlab repository.

License
-------

GPLv3

Author Information
------------------

Randy Romero <randy.romero@redhat.com>   
Michael DiDato <mdidato@redhat.com>  
Matt Willis <mawillis@redhat.com>

