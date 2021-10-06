resource "aws_route_table" "dev-public-rt" {
  vpc_id = aws_vpc.dev-vpc.id
  route {
    cidr_block = "0.0.0.0/0" # allow all from everywhere 
    gateway_id = aws_internet_gateway.dev-igw.id
  }
  tags = {
    Name = "dev-public-rt"
  }
}

resource "aws_route_table_association" "dev-rta-public-subnet-1" {
  subnet_id      = aws_subnet.dev-subnet-public-1.id
  route_table_id = aws_route_table.dev-public-rt.id
}
