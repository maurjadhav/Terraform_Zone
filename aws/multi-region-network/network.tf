resource "aws_vpc" "primary" {
  cidr_block = var.primary_network_cidr
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "subnets" {
  count             = length(var.subnet_names)
  vpc_id            = aws_vpc.primary.id
  cidr_block        = var.subnets_cidrs[count.index]
  availability_zone = var.subnet_azs[count.index]
  tags = {
    Name = var.subnet_names[count.index]
  }

  depends_on = [aws_vpc.primary]

}