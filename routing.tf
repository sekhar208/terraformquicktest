resource "aws_route_table" "public-routing-table" {
    vpc_id = aws_vpc.default.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.default.id
    }
    tags = {
        Name = "Public_Routing_Table"
    }
}


resource "aws_route_table" "private-routing-table" {
    vpc_id = aws_vpc.default.id
    tags = {
        Name = "Private_Routing_Table"
    }
}

resource "aws_route_table_association" "public-routing-assos" {
    #count = 3
    count =  length(var.publiccidrs)
    subnet_id = element(aws_subnet.public-subnet.*.id,count.index)
    route_table_id = aws_route_table.public-routing-table.id
}


resource "aws_route_table_association" "private-routing-assos" {
    #count = 3
    count = length(var.privatecidrs)
    subnet_id = element(aws_subnet.private-subnet.*.id,count.index)
    route_table_id = aws_route_table.private-routing-table.id
}