# AWS-TEST01
Initial testing to use Terraform with AWS, to see what I can make from a few sources. I'm building this out while studying for AWS SysOps Associate exam.

## Structure and Use
There are several terraform files to describe each kind of resource with a variable file to hold all the specific values used.

## Source Material
* [The French guy's class on SysOps](https://www.udemy.com/course/ultimate-aws-certified-sysops-administrator-associate)
* [Hashicorp Getting Started](https://learn.hashicorp.com/tutorials/terraform/infrastructure-as-code?in=terraform/aws-get-started)
* [ec2 with ssh access](https://medium.com/@hmalgewatta/setting-up-an-aws-ec2-instance-with-ssh-access-using-terraform-c336c812322f)
* [vpc in terraform](https://jaffarshaik.medium.com/implementing-vpc-architecture-using-terraform-3de6c42d7646)
* [public and private subnets in terraform](https://medium.com/geekculture/how-to-manage-public-and-private-subnets-in-aws-with-terraform-69c272003c81)
* [terraform and cidrs](http://blog.itsjustcode.net/blog/2017/11/18/terraform-cidrsubnet-deconstructed/)

## Step 0
Things I had to do to get this so it would work-
1. Get AWS account
1. [Make IAM user](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html#id_users_create_console) and save key and secret
1. Download [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-windows.html#cliv2-windows-install) and [Terraform](https://www.terraform.io/downloads.html)
1. [Import-Module](https://docs.aws.amazon.com/powershell/latest/userguide/pstools-getting-set-up-windows.html#ps-installing-awswindowspowershell) aws PowerShell
1. Run [configuration tool](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html#cli-configure-files-methods) to get my secret loaded into AWS CLI
1. [Add Terraform](https://stackoverflow.com/questions/1618280/where-can-i-set-path-to-make-exe-on-windows) to Windows PATH

After I did all that, and probably the PowerShell stuff isn't needed, I'm able to run the code in this repo against AWS and make stuff!
