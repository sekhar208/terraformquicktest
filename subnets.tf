# Public Subnets
# 10.1.1.0/24, 10.1.2.0/24,10.1.3.0/24
#    1a         1b             1c

# Private Subnets
# 10.1.10.0/24, 10.1.20.0/24,10.1.30.0/24
#    1a         1b             1c



resource "aws_subnet" "public-subnet" {
    #count = 3  # 0,1,2
    count =  length(var.publiccidrs)
    vpc_id = aws_vpc.default.id
    cidr_block = element(var.publiccidrs,count.index)
    availability_zone = element(var.azs,count.index)

    tags = {
        #Name = "public-subnet-${count.index}"  # This will give indices 0,1,2
        Name = "public-subnet-${count.index+1}"  # to get indices 1,2,3
    }
}

resource "aws_subnet" "private-subnet" {
    #count = 3
    count = length(var.privatecidrs)
    vpc_id = aws_vpc.default.id
    cidr_block = element(var.privatecidrs,count.index)
    availability_zone = element(var.azs,count.index)

    tags = {
        Name = "private-subnet-${count.index+1}"
    }
}






