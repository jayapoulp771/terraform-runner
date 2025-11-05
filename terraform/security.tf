resource "aws_security_group" "mytask_sgn" {
  name = "mytask_sgn"
  description = "allow mysql"
  vpc_id = var.vpc_id

  ingress {
    description = "Allow Mysql"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }  
  egress {
    description = "outbound"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name = "mytask_sgn"
  }
}
