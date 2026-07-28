#ec2-instance variables
variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
}

variable "instance_id" {
    type = string
    default = "t3.micro"
}

variable "tags" {
    type = map
    default = {
        Name = "terraform_practice"
        Project = "practice"
        Component = "practice-1"
        Environment = "Dev"
        Terraform = "true"
    }
}

#Security group using variables
variable "sg_name" {
    type = string
    default = "Allow SSH"
}

variable "sg_description" {
    type = string
    default = "Allow SSH protocal port number 22"
}

#ingress
variable "ingress_descr" {
    type = string 
    default = "Allow port number 22"
}

variable "ingress_port_number" {
    type = number
    default = 22
}

variable "ingress_protocol" {
    type = string
    default = "tcp"
}

variable "sg_cidr_blocks" {
    type = list
    default = ["0.0.0.0/0"]
}

#egress
variable "egress_descr" {
    type = string 
    default = "Allow all"
}

variable "egress_port_number" {
    type = number
    default = 0
}

variable "egress_protocol" {
    type = string
    default = "-1"
}