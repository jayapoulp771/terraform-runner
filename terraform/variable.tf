variable "vpc_id" {
    type = string
    default = "vpc-0daa19e29dc8d4dc6"
}
variable "subnet_id" {
    type = string
    default = "subnet-07558176df797e557"
}
variable "ami_id" {
    type = string
    default = "ami-0601422bf6afa8ac3"
}
variable "vpc_security_group_id"{
type = string
default = "sg-007107407378b9669"  
}

variable "db_security_group_id" {
    type = string
    default = "sg-09b342ca2b5a37b1f"
  
}
variable "route_table_id" {
    type = string
    default = "rtb-01436ce21e0e9175d"
  
}
