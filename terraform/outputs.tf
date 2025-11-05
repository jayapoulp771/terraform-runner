output "public_ip" {
    description = "public ip of the redhat instance"
    value = aws_instance.rhel_mytask.public_ip
}
