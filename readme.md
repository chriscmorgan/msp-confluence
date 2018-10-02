run packer with the below command:
./(packer install location) build -var 'confpass=(password you want to use for the confluence db user)' confluence-install.json

E.G. ../packer build -var 'confpass=enter-password' confluence-install.json

