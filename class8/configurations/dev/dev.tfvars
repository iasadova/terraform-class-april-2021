private_subnet1_range    = "10.0.1.0/24" 
private_subnet2_range    = "10.0.2.0/24" 
private_subnet3_range    = "10.0.3.0/24" 
resource_group_name      = "dev"           #Precreate this while creating Backend Container 
security_group_name      = "sec_group1" 
vm1_computername         = "vm1" 
vm2_computername         = "vm2" 
vm3_computername         = "vm3" 
address_space            = "10.0.0.0/16" 
vnet_name                = "vnet1" 
location                 = "eastus" 
ssh_key                  = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDCU0qzHw9qppZuGsbMnPk8+u3XSoBiIp4hf0JyMmFHVfdc66dB3r3T0wp9m90xUO5CVriV7ydbevXVx+8rUM1NsmGcp0Q15694awogPK1VXXIF9CRHj74hYD8ILkA8zkILnYGMJoZNUbi9pYK/IYWiEXV/VB/UtEZbMgVo5qEooiXyKUUD8XRPV+m9w0YIW5kMJPw87OqoerfJ43iGRlWPAHxitTuUnRBQGOx9WgdCphcXUH0MNL2XEXZXpgnWv6bXX4r3YldLHeQaHRBQkXcCJ3N0I9li+P0b3CpHmx0hLTVetPDWyz5cWKi/UrPA/v13oVz6qGu91bdc/XxuRPAT berkay@cc-fb59a6a6-6694484894-59kr4" 
environment              = "dev" 
storage_account          = "dev1farrukh" 

 

 

#OS Information 

publisher                = "OpenLogic" 
offer                    = "CentOS" 
sku                      = "7.5" 
version                  = "latest" 
admin_username           = "centos" 
vm_size                  = "Standard_DS1_v2" 