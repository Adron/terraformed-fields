//ami-56997436

resource "aws_instance" "aws-brood-server-1" {
  ami = "ami-56997436"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    "sg-2572265e"]
  subnet_id = "subnet-ae1d3ec9"

  tags {
    Name = "Debian"
  }
}
