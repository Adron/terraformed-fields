# Create a way out to the internet
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.vpc_prod.id}"
  tags {
    Name = "InternetGateway"
  }
}