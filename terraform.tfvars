#aws_access_key = "xxxxx"
#aws_secret_key = "xxxxx"
aws_region = "us-east-2"
vpc_cidr = "10.1.0.0/16"
vpc_name = "terraform-aws-testing"
IGW_name = "terraform-aws-igw"

key_name = "Desktop"
environment = "dev"

publiccidrs = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
privatecidrs = ["10.1.10.0/24", "10.1.20.0/24", "10.1.30.0/24"]
azs = ["us-east-2a", "us-east-2b", "us-east-2c"]
