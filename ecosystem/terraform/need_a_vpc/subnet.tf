# Create a subnet in the AZ us-west-2a
resource "aws_subnet" "subnet_us_west_2a" {
  vpc_id = "${aws_vpc.vpc_prod.id}"
  cidr_block              = "172.31.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-west-2a"
  tags = {
    Name =  "Subnet az 2a"
  }
}

# Create a subnet in the AZ us-west-2b
resource "aws_subnet" "subnet_us_west_2b" {
  vpc_id = "${aws_vpc.vpc_prod.id}"
  cidr_block              = "172.31.2.0/24"
  availability_zone = "us-west-2b"
  tags = {
    Name =  "Subnet az 2b"
  }
}

# Create a subnet in the AZ us-west-2c
resource "aws_subnet" "subnet_us_west_2c" {
  vpc_id = "${aws_vpc.vpc_prod.id}"
  cidr_block              = "172.31.3.0/24"
  availability_zone = "us-west-2c"
  tags = {
    Name =  "Subnet az 2c"
  }
}