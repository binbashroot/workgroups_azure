# Practice Tasks for RHCSA

NOTES:  
Any files in a user's home directory must be owner/group of the user

# Perform the following tasks
### Task 1

**Change IP**
>Change the eth1 interface of VM2 
> IP: **10.0.2.121**
> NETMASK: **255.255.255.0**
> GATEWAY: **10.0.2.1**
>This change must persist through reboots
>
**Change Hostname**
>Change the hostname of VM2 to: **serverb.example.com**
>This change must persist through reboots

**SELinux**
> Validate/Configure SELinux so it is enforced
> Ensure SELinux enforcment is persistent across a reboot

### Task 2
**Add the following repos to the system**  
**NOTE: REPLACE qnapbu.example.com with your local yum repo that is being served via httpd**
> BaseOS 
>> http://qnapbu.example.com/repo/BaseOS  

> AppStream  
>> http://qnapbu.example.com/repo/AppStream  

**Install a web server**
> Install the httpd package on servera.example.com  
> The web services must survive a reboot  
> Validate via the following webpage http://servera.example.com/exam/

### Task 3
**Filesystem** 
>Create and mount a filesystem using your primary disk  
>Filesystem must be 850MiB in size  
>Filesystem must use an ext3 filesytem  
>Filesystem must be mounted on /mnt/task3  
>Partition must be named task3  
>The mount point must survive a reboot  

### Task 4
**Create a script**
> The script is called task4.sh  
> The script must create five files in /opt/dc    
> The filenames are superman, batman, aquaman, flash, wonderwoman  
> The script must reside in /opt/scripts  
> The file name extension must be ".out"  
> Each file must contain the current date and time  
> The script must only be executable by root  

### Task 5
**Create a script**
> The script is named task5.sh   
> The script must reside in /opt/scripts  
> The script must create five users  
> All users must be part of the goodguys group  
> The script should only be executable by root  
> All users must belong to the group named "marvel"  
>> spiderman  
>> wolverine  
>> thor  
>> hulk  
>> ironman  

### Task 6
**Create a script**
> The script is named task6.sh  
> The script must reside in /opt/scripts  
> The script must create five users  
> All users must be part of the badguys group  
> The script should only be executable by root  
> All users must belong to a secondary group named "marvel"  
>> sandman  
>> sabertooth  
>> loki  
>> thanos  
>> ultron  
> run the script and ensure it works and has created the users/groups

### Task 7
**Create a text file**
>The file must reside in /home/student  
>The file must be called task7.txt  
>The file must contain the partition table of the primary disk

### Task 8
**Create a text file**
>The file must reside in /home/student  
>The file must be called last.out  
>The file must contain a list of dates/times of the historical reboots for the server
### Task 9
**Create a text file**  
>***NOTE:*** You will run the following command as your starting point:  
>***getent group marvel|cut -d: -f4|tr , '\n'***   
>
>File must be called marvel_tb_3.txt  
>File must reside in /home/student
>File must contain the top and bottom three users of the full sorted list  

### Task 10
**Filesystem** 
>Create and mount a filesystem using your primary disk  
>Filesystem must be 500MiB in size  
>Filesystem must use an xfs filesytem  
>Filesystem must be mounted on /mnt/task10 
>Partition must be named task10  
>The mount point must survive a reboot  

### Task 11
**Folder Permissions**
>Create a directory called /opt/heros  
>The owner of the folder should be root  
>The group of the folder should be goodguys   
>The permissions of the folder should only allow root and users in the goodguys group access to read/write files, but everyone should be able "list" files  

### Task 12
**Folder Permissions**  
>Create a directory in /opt called villians  
>The owner of the folder should be root  
>The group of the folder should be villians  
>The permissions of the folder should only allow root and users in the badguys group access to read/write files.  
>The root user and users in the badguys group must be able to list files but all other users should not be able to list the contents of the /opt/villians directory

### Task 13
Add a two new partitions to your secondary disk
>One partition must be 500MiB in size  
>One partition must be 250MiB in size  
>The partition that is 250MiB should have an ext3 filesystem  
>The partition that is 500MiB should have an xfs filesystem  
>The ext3 filesystem should be mounted on /mnt/task13_ext3  
>The xfs filesystem should be mounted on /mnt/task13_xfs  

### Task 14
**Copy Files**
>Copy all the files in the /opt/test1 dirs to a directory called /opt/copied  
>Files must be owned by the directory owner
>Files must belong to the group owned by the directory group 
>>Files in /opt/copied must be readable by everyone  
>>Files in /opt/copied must read/write by the owner  
>>Files in /opt/copied must be read/write by the group  
>>The directory must be owned by student   
>>The directory must be owned by goodguys group  

### Task 15
**Move files**
>Move all the files in /opt/test2 to /opt/moved  
>Permissions of all files should be owned by student  
>All files must be in the student group  
>Files should be read and writeable for user and read-only for group and world  
>All users on the system should be able to list all files in the /opt/moved directory  

### Task 16
**Compressed Files**
>Create a compressed called test3.targz  
>The file must contain of all the files from /opt/test3   
>The compressed file must reside in /tmp  
>The file must use gzip compression  
>The task must be completed in a single command  
>Put the command you used in a script called /opt/scripts/task16.sh  

### Task 16
**Find Files**
>Find all files owned by larry and copy them to a folder called /tmp/task17_files

### Task 17
**Chrony**
>Configure servera.example.com to be a ntp client from serverb.example.com  
>Validate time has been properly synced and write results to /tmp/time_validation.out

### Task 18
**Logical volumes**
> On serverb.example.com
>> Using /dev/sdb do the following:
>>> Create a 1G partition  
>>> Create a 500M logical volume 500M that belongs to the rhcsavg volume group  
>>>

**Swap**
>On serverb.example.com
>>Create a 2G swap partition  
>>Swap partition must persist across reboots  
>>

## Task 18
**Configure nfs to mount user home directories automatically**
> The following three users larry, moe, and curly must be able to automatically mount their shared directories
> from serverb.example.com whenever they log into servera.example.com

## Task 19
**Configure httpd to use nfs**
> SOURCE: serverb.example.com:/webfiles
> DESTINATION HOST: servera.example.com
> The mount point on the destination host should /var/www/html/rhcsa
> The mount point on the destination host should persist across reboots
> You must be able to see http://servera.example.com/rhcsa/index.html  

## Task 20
**Create mount as an indirect autofs mount**
> Configure servera.example.com to mount files from serverb.example.com:/share/data to /shares/data whenever someone enters the /shares/data directory

## Task 21
**Create mount as an direct autofs mount**
> Mount the following nfs share on servera.example.com
> SOURCE:  serverb.example.com:/share/data2
> Configure servera.example.com to mount files from serverb.example.com:/share/data2 to /data2
> whenever /data2 is accessed

## Task 22
**Configure a directory to be used by multiple teams**
> Create the /opt/marvel directory
> THe directory should be owned by student
> The group should be owned by marvel
> Any created, copied, or moved to /opt/marvel should become automatically be owned by the marvel group.

## Task 23
**Configure httpd to listen on port 8888**
> Modify apache webserver to listen on port 8888
> Restart the httpd service
> You must be able to see http://servera.example.com:8888/exam/index.html  

## Task 24
**Install and Configure Time Sync Software**
> Configure servera as a time sync client to 192.168.1.122

