provider "azurerm" { 
  version = "1.27" 
} 



terraform { 
   required_version = "0.11.14"
   backend "azurerm" { 
    resource_group_name       = "dev" 
    storage_account_name      = "dev1berkay" 
    container_name            = "devcontainer" 
    access_key                = "Y9Pkd180W+x2uy6JkLFDupd/h3qWDxnwJQGYXbGbdWhaazQWxkGvNdVg7GOdAMJt2Hs4VU4QUV3BbtdmPmRF7A==" 
    key                       = "dev_terraform.tfstate" 
  } 
} 