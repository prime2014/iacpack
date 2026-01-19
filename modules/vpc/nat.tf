# Create one Elastic IP per public subnet (AZ)
resource "aws_eip" "nat" {
  count  = length(aws_subnet.public_subnet)
  domain = "vpc"

  tags = {
    Name = "${var.resource_prefix}_eip-${count.index + 1}"
  }
}

# Create one NAT Gateway per public subnet (AZ)
resource "aws_nat_gateway" "nat" {
  count         = length(aws_subnet.public_subnet)
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.public_subnet[count.index].id

  depends_on = [aws_internet_gateway.igw]

  tags = {
    Name = "${var.resource_prefix}_nat-${count.index + 1}"
  }
}
