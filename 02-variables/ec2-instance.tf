#To create ec2-instance using variables
resource "aws_instance" "instance_terraform" {
    ami = var.ami_id
    instance_type = var.instance_id
    vpc_security_group_ids = [aws_security_group.sg_terraform.id]
    tags = var.tags
}


#To create Security group using variables
resource "aws_security_group" "sg_terraform" {
    name = var.sg_name
    description = var.sg_description

    #inbound rule
    #below are called ingress block in terraform
    ingress{
        description = var.ingress_descr
        from_port = var.ingress_port_number
        to_port = var.ingress_port_number
        protocol = var.ingress_protocol
        cidr_blocks = var.sg_cidr_blocks
    }

    #outbound rule
    #below are called ingress block in terraform
    egress{
        description = var.egress_descr
        from_port = var.egress_port_number
        to_port = var.egress_port_number
        protocol = var.egress_protocol
        cidr_blocks = var.sg_cidr_blocks
    }

    tags = var.tags
}

