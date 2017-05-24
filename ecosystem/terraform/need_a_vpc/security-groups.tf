//AWS Security Group(s)

// Everything
//resource "aws_security_group" "allow_all" {
//  name        = "allow_all"
//  description = "Allow all inbound traffic"
//
//  ingress {
//    from_port   = 0
//    to_port     = 0
//    protocol    = "-1"
//    cidr_blocks = ["0.0.0.0/0"]
//  }
//
//  egress {
//    from_port       = 0
//    to_port         = 0
//    protocol        = "-1"
//    cidr_blocks     = ["0.0.0.0/0"]
//    prefix_list_ids = ["pl-12c4e678"]
//  }
//}

// SSH
//AWS Security Group(s)
resource "aws_security_group" "ssh" {
  name        = "ssh"
  description = "Allow port 22 ssh inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
