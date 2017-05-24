# Create a VPC to launch our instances into
resource "aws_vpc" "vpc_prod" {
  cidr_block = "172.31.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "ProductionVPC"
  }
}