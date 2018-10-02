run packer with the below command:
./(packer install location) build -var 'confpass=(password you want to use for the confluence db user)' confluence-install.json

E.G. ../packer build -var 'confpass=enter-password' confluence-install.json

Once the AMI is created you can spin it up with ports 8090 and 8091 open.
Start services with these commands:
#!/bin/bash
sudo service httpd start
sudo service mysqld start
/opt/atlassian-confluence-6.12.0/bin/start-confluence.sh

Todo - mysqld and confluence to run as services.
     - Need a backup strategy for confluence and mysql
     - user connection to Jira for users and groups.


