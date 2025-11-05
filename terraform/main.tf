    resource "aws_instance" "rhel_mytask" {
    ami = var.ami_id
    instance_type = "t3.micro"
    subnet_id = var.subnet_id
    associate_public_ip_address = true
    vpc_security_group_ids = [aws_security_group.terraform_sg.id]
    iam_instance_profile = "terraform-runner"

    user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y docker
    systemctl enable docker
    systemctl start docker
    usermod -aG docker ec2-user

    docker run -d --name mysql-light -e MYSQL_ROOT_PASSWORD=root123 -e MYSQL_DATABASE=mydb -e MYSQL_USER=myuser -e MYSQL_PASSWORD=1234 -p 3306:3306 mysql:8.0
    EOF

    tags = {
      Name = "rhel_mytask"
    }
    }

    resource "aws_route_tale_association" "rtb_assoc" {
        subnet_id = var.subnet_id
        route_table_id = var.route_table_id
    }
