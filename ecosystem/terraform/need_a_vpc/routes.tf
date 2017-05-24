# Public route as way out to the internet
resource "aws_route" "internet_access" {
  route_table_id = "${aws_vpc.vpc_prod.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.gw.id}"
}


# Create the private route table
resource "aws_route_table" "private_route_table" {
  vpc_id = "${aws_vpc.vpc_prod.id}"

  tags {
    Name = "Private route table"
  }
}

# Create private route
resource "aws_route" "private_route" {
  route_table_id  = "${aws_route_table.private_route_table.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = "${aws_nat_gateway.nat.id}"
}