Deploy Terraform plan with ansible
=========

This project will deploy a terraform plan that creates three azure vms and an instance of azure application gateway.  Once the terraform plan is complete ansible will then install httpd on VMs.

Requirements
------------

- cloud.terraform collection
- ansible.posix collection
- terraform

Enviormental variables
- ARM_SUBSCRIPTION_ID=""
- ARM_TENANT_ID=""
- ARM_CLIENT_ID=""
- ARM_CLIENT_SECRET=""
- ARM_SKIP_PROVIDER_REGISTRATION=true

Role Variables
--------------

Dependencies
------------

None

Example Syntax 
----------------

```
To run terraform plan

    ansible-playbook -i inventory_azure_rm.yml deploy_terraform_plan.yml


```

Example Playbook 
----------------

```
```

License
-------

MIT

Author Information
------------------

Michael DiDato
mdidato@redhat.com


