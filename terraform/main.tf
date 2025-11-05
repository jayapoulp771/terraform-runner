variable "rhel_ami" {
    default = "ami-06d2e6fdb95d0813e"
}

resource "aws_instance" "rhel_mytask" {
    ami = var.rhel_ami
    instance_type = "t3.micro"
    associate_public_ip_address = true

    user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y docker
    systemctl enable docker
    systemctl start docker
    usermod -aG docker ec2-user

    docker run -d --name mysql-light -e MYSQL_ROOT_PASSWORD=root123 -e MYSQL_DATABASE=mydb -e MYSQL_USER=myuser -e MYSQL_PASSWORD=1234 -p 3306:3306 mysql:8.0
    EOF

    }