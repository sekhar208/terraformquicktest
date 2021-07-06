resource "aws_instance" "public-servers" {
    #count = 3
    count = var.environment == "Prod" ? 3 : 1

    #lookup(map, key, default)
    ami = lookup(var.amis,var.aws_region,"us-east-2")
    instance_type = "t2.micro"
    key_name = var.key_name
    subnet_id = element(aws_subnet.public-subnet.*.id,count.index)
    vpc_security_group_ids = [aws_security_group.allow_all.id]
    associate_public_ip_address = true	
    tags = {
        Name = "public-server-${count.index}"
        Env = var.environment
        Owner = "Chandu"
        CostCenter = "ABCD"
    }
    user_data = <<-EOF
		#! /bin/bash
        sudo apt-get update
		sudo apt-get install -y nginx
		sudo systemctl start nginx
		echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html
	EOF
} 