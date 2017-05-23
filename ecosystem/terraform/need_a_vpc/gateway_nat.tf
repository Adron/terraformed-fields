# Create a nat gateway and it will depend on the internet gateway creation
resource "aws_nat_gateway" "nat" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id = "${aws_subnet.subnet_us_west_2a.id}"
  depends_on = ["aws_internet_gateway.gw"]
}