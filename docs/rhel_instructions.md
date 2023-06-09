Quick Start Instructions
====
 These instructions will provide the steps needed to provision hosts in the Azure Open Environment for Red Hat Employees. The following instructions cover :
- RHEL9
- FEDORA37  
***Note:***  
Other variants should work but will need minor adjustments to the code

## Ordering your Azure Open Environment
### Using your web browser, order your Azure Open Environment
1. Log into [https://demo.redhat.com](https://demo.redhat.com)
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
8. If this is your first time ordering an Azure environment through RHPDS, you will asked to accept an invite from Microsoft. You must accept this invite before being granted Azure access. You only need to do this once.  
NOTE: Subsequent Azure requests will not send an invite.
9.  You will sent an email with the same information from the details page about your Azure environment.  

## Preparing Your Local Resources
### Gitlab Access Token
1. Create a personal access [token](https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html) to access https://gitlab.consulting.redhat.com/rhcsa/workgroup  (Be sure to copy the token, you'll need it later on)

#### Open a terminal 
**NOTE** *Yeah we could automate this part, but then how would you learn?*
1. Generate an ssh key to be used to access Azure
```bash
  ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa_rhpds -N ''
```
1. Clone the azure_workgroups repository to your local machine
```bash
$ git clone git@github.com:binbashroot/workgroups_azure.git
$ cd workgroup_azure
$ git checkout devel
```

1.  Create a dnf repo for terraform
```bash
    sudo tee << EOF /etc/yum.repos.d/hashicorp.repo 
    [hashicorp]
    name=Hashicorp Stable - \$basearch
    baseurl=https://rpm.releases.hashicorp.com/RHEL/\$releasever/\$basearch/stable
    enabled=1
    gpgcheck=1
    gpgkey=https://rpm.releases.hashicorp.com/gpg
    EOF
```
1. Install required rpms, collections, and python libraries
```bash
sudo dnf install ansible-core python3-pip terraform -y
cd /path/to/cloned/directory
ansible-galaxy collection install -r collections/requirements.yml 
pip install -r ~/.ansible/collections/ansible_collections/azure/azcollection/requirements-azure.txt --user
pip install oauthlib --upgrade --user
```
1. Create an ".azurerc" file in your home directory(copy/paste the variables from email)
**EXAMPLE**
```
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

# COPY THESE VARIABLES TOO
# NEEDED FOR TERRAFORM VIA ANSIBLE
export ARM_RESOURCE_GROUP=${RESOURCEGROUP}
export ARM_SUBSCRIPTION_ID=${SUBSCRIPTION}
export ARM_TENANT_ID=${TENANT}
export ARM_CLIENT_ID=${CLIENT_ID}
export ARM_CLIENT_SECRET=${PASSWORD}

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
| Mkdocs is not not reachable| As the student user (NOT ROOT) run "systemctl --user restart mkdocs on rhcsa-vm-2|
