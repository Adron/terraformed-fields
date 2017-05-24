# Associate subnet subnet_eu_west_1a to public route table
resource "aws_route_table_association" "subnet_eu_west_1a_association" {
  subnet_id = "${aws_subnet.subnet_us_west_2a.id}"
  route_table_id = "${aws_vpc.vpc_prod.main_route_table_id}"
}

# Associate subnet subnet_eu_west_1b to private route table
resource "aws_route_table_association" "subnet_eu_west_1b_association" {
  subnet_id = "${aws_subnet.subnet_us_west_2b.id}"
  route_table_id = "${aws_route_table.private_route_table.id}"
}

# Associate subnet subnet_eu_west_1c to private route table
resource "aws_route_table_association" "subnet_eu_west_1c_association" {
  subnet_id = "${aws_subnet.subnet_us_west_2c.id}"
  route_table_id = "${aws_route_table.private_route_table.id}"
}