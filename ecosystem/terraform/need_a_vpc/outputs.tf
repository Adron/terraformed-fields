output "security_group_id" {
  value = "${aws_security_group.ssh.id}"
}

output "vpc_id" {
  value = "${aws_vpc.vpc_prod.id}"
}

output "subnet_id" {
  value = "${aws_subnet.subnet_us_west_2a.id}"
}