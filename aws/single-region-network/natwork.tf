# creating the vpc
resource "aws_vpc" "primary" {
  cidr_block = var.network_info.cidr_block
  tags = {
    Name = var.network_info.name
  }
}

# creating the private subnets
resource "aws_subnet" "private" {
  count             = length(var.private_subnets)
  vpc_id            = aws_vpc.primary.id
  availability_zone = var.private_subnets[count.index].av_zone
  cidr_block        = var.private_subnets[count.index].cidr_range
  tags = {
    Name = var.private_subnets[count.index].name
  }

  depends_on = [aws_vpc.primary]

}

# creating the public subnets
resource "aws_subnet" "public" {
  count             = length(var.public_subnets)
  vpc_id            = aws_vpc.primary.id
  availability_zone = var.public_subnets[count.index].av_zone
  cidr_block        = var.public_subnets[count.index].cidr_range
  tags = {
    Name = var.public_subnets[count.index].name
  }

  depends_on = [aws_vpc.primary]

}

# internet gatway
resource "aws_internet_gateway" "internet-getway" {
  vpc_id = aws_vpc.primary.id
  tags = {
    Name = "internet-getway"
  }
  depends_on = [aws_vpc.primary]

}

# create public route table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.primary.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-getway.id
  }

  depends_on = [aws_vpc.primary, aws_internet_gateway.internet-getway]
}




# associate public subnets with public route table
resource "aws_route_table_association" "public" {
  count          = length(var.public_subnets)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id

  depends_on = [aws_route_table.public, aws_subnet.public]

}
