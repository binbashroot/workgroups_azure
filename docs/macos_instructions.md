Quick Start 
====
### Using your web browser order your Azure Open Environment
1. Log into demo.redhat.com
2. Select [Open Environment](images/openenv.png)
3. Select [Azure Blank Open Environment](images/azureblankenv.png)
4. Click on [Order](images/azurebedesc.png) in the Description page
5. Select the following options:  
Activity = Training  
Salesforce ID = Leave Blank  
Region = eastus (default)
Auto-Destroy = (7 days from now)  
Click Checkbox
Click "Order"
6. You will be presented with a "[Provision Pending](images/provisionpending.png)" page. (This takes about 5 minutes)
7. When your provising is completed you will be presented with a [Details](images/detailspage.png) page.
8. If this is your first time ordering an Azure environment through RHPDS, you will asked to accept an invite from Microsoft. You must accept this invite before being granted Azure access. You only need to do this once.  Future Azure requests will not send an invite.
9.  You will sent an email with the same information from the details page about your Azure environment.  

### Gitlab Access Token
1. Create a personal access [token](https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html) to access https://gitlab.consulting.redhat.com/rhcsa/workgroup  (Be sure to copy the token, you'll need it later on)

### Instructions for:
- MacOS
***Note:***  

#### Open a terminal 
1. Generate an ssh key to be used to access Azure
```bash
  ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa_rhpds -N ''
```

2.  Install terraform
```bash
  TBD
```
3. Install required rpms, collections, and python libraries
```bash
sudo brew install ansible-core python3-pip 
ansible-galaxy collection install ansible.posix
ansible-galaxy collection install cloud.terraform
ansible-galaxy collection install azure.azcollection
ansible-galaxy collection install community.general
pip install -r ~/.ansible/collections/ansible_collections/azure/azcollection/requirements-azure.txt --user
pip install oauthlib --upgrade --user
```
4. Create an ".azurerc" file in your home directory(copy/paste the variables from email)
**EXAMPLE**
```
#MACOS  TBD CONVERT VARS FOR ZSH
$ vi ~/.azurerc
export GITUSER=$USE_YOUR_SSO_LOGIN_ID
export GITLAB_TOKEN=$USE_THE_TOKEN_YOU_CREATED

# COPY VARIABLES FROM YOUR EMAIL
export GUID=5t**
export CLIENT_ID=7250db1a-****-****-****-************
export PASSWORD=9rPBQJA~*******-*****************-
export TENANT=1ce7852f-****-****-****-************
export SUBSCRIPTION=ede7f891-****-****-****-************
export RESOURCEGROUP=openenv-5t***

# COPY THESE VARIABLES TOO
# NEEDED FOR ANSIBLE 
export AZURE_CLIENT_ID=${CLIENT_ID}
export AZURE_SECRET=${PASSWORD}
export AZURE_TENANT=${TENANT}
export AZURE_SUBSCRIPTION_ID=${SUBSCRIPTION}
export AZURE_RESOURCE_GROUP=${RESOURCEGROUP}

# NEEDED FOR TERRAFORM VIA ANSIBLE
export ARM_RESOURCE_GROUP=${RESOURCEGROUP}
export ARM_SUBSCRIPTION_ID=${SUBSCRIPTION}
export ARM_TENANT_ID=${TENANT}
export ARM_CLIENT_ID=${CLIENT_ID}
export ARM_CLIENT_SECRET=${PASSWORD}
```

5. Clone the azure_workgroups repository
```bash
$ git clone git@github.com:binbashroot/workgroups_azure.git
$ cd workgroup_azure
$ git checkout devel
```

6. Run the the playbook
```bash
# To create a RHCSA practice lab
ansible-playbook -i inventory deploy_terraform_play.yml -e workgroup=rhcsa 

# To provision basic servers with no modifications
ansible-playbook -i inventory deploy_terraform_play.yml -e workgroup=rhcsa  -e only_tf=true

# To deprovision the environment
ansible-playbook -i inventory DESTROY_TERRAFORM_BUILD.yml -e workgroup=rhcsa 

```

Troubleshooting
----------------

|Symptom|Fix|
|:---|---|
| deploy_terraform_plan.yml playbook fails| Rerun playbook |
| Determine your host's public IPs| ansible-inventory -i inventory --list \|grep ansible_host |
|||
