
This is an module to creates a VPC with 6 subnets( 3public and 3 private ).

This is an module that creates R1-soft back up server on aws with efs than mounts it with nfs.

module "backup-server" {
  source = "module"
  region = "us-east-1"
  cidr_block              =       "10.0.0.0/16"
  public_cidr_block1      =       "10.0.101.0/24"
  public_cidr_block2      =       "10.0.102.0/24"
  public_cidr_block3      =       "10.0.103.0/24"
  private_cidr_block1     =       "10.0.1.0/24"
  private_cidr_block2     =       "10.0.2.0/24"
  private_cidr_block3     =       "10.0.3.0/24"
}

Inputs
Name	                        Description	Type	                        Default     	        Required
region  	                	name of the region	                        none                    yes
cidr_block                      required cidr_block for VPC                 none                    yes
public_cidr_block1              required cidr_block for public subnet 1     none                    yes
public_cidr_block2              required cidr_block for public subnet 2     none                    yes
public_cidr_block3              required cidr_block for public subnet 3     none                    yes
private_cidr_block1             required cidr_block for private subnet 1    none                    yes
private_cidr_block2             required cidr_block for private subnet 2    none                    yes
private_cidr_block3             required cidr_block for private subnet 3    none                    yes

Outputs
Name    	                Description
username                    username of R1-soft user
password                    password of R1-soft user

