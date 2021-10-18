# AWS-TEST01
Initial testing to use Terraform with AWS, to see what I can make from a few sources.

## Structure and Use
There are several terraform files to describe each kind of resource with a variable file to hold all the specific values used.

## Source Material
* [Hashicorp Getting Started](https://learn.hashicorp.com/tutorials/terraform/infrastructure-as-code?in=terraform/aws-get-started)
* [ec2 with ssh access](https://medium.com/@hmalgewatta/setting-up-an-aws-ec2-instance-with-ssh-access-using-terraform-c336c812322f)
* [vpc in terraform](https://jaffarshaik.medium.com/implementing-vpc-architecture-using-terraform-3de6c42d7646)

## Step 0
Things I had to do to get this so it would work-
1 Get AWS account
2 Make IAM user and save key and secret
3 Download AWS CLI and Terraform
4 Import-Module aws PowerShell
5 Run configuration tool to get my secret loaded into AWS CLI
6 Add Terraform to Windows PATH
