data "aws_availability_zones" "az" {
  state = "available"

  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}


resource "aws_subnet" "private_subnet" {
  count                   = 2
  map_public_ip_on_launch = false
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(aws_vpc.main.cidr_block, 8, count.index + 10) # Creates 10.0.10.0/24, 10.0.11.0/24
  availability_zone       = data.aws_availability_zones.az.names[count.index]

  tags = {
    Name                                            = "${var.resource_prefix}-private-${data.aws_availability_zones.az.names[count.index]}"
    "kubernetes.io/role/internal-elb"               = "1"
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
    Type                                            = "Private"
  }
}


resource "aws_subnet" "public_subnet" {
  count                   = 2
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(aws_vpc.main.cidr_block, 8, count.index) # Creates 10.0.0.0/24, 10.0.1.0/24
  availability_zone       = data.aws_availability_zones.az.names[count.index]

  tags = {
    Name                                            = "${var.resource_prefix}-public-${data.aws_availability_zones.az.names[count.index]}"
    "kubernetes.io/role/elb"                        = "1"
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
    Type                                            = "Public"
  }
}

