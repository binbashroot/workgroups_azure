Quick Start 
====
### Order your Azure Open Environment
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

### Configure your environment variables after successful ordering of your Azure Open Environment
1. Open a terminal
2. Using the information from your email as reference export your bash variables in your terminal. To make them persistent, you may want to add them to  your .bashrc file and save yourself typing them over and over. 

##### **EXAMPLE VARS RECECEIVED BY EMAILS**
- export GUID=sfcw4
- export CLIENT_ID=a24a3751-****************  
- export PASSWORD=WJ.8PM0L******************  
- export TENANT=1ce7852f-d******************  
- export SUBSCRIPTION=ede7f891-***********  
- export RESOURCEGROUP=openenv-sf**  

***NOTE: PASSWORD VARIABLE ABOVE = AZURE_SECRET BELOW***
#### **Modify them to be ANSIBLE variables**  
- export AZURE_RESOURCE_GROUP=openenv-t5r4z  
- export AZURE_TENANT=1ce7852f-*********
- export AZURE_SUBSCRIPTION_ID=ede7f891-*******
- export AZURE_CLIENT_ID=0e5fee42-****
- export AZURE_SECRET=60Us******

### Git clone the code
```bash
git clone http://path/to/git/repo  
cd clone repo   
cd repo  
```

