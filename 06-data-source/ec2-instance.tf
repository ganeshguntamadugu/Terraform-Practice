# To create ec2-instance
resource "aws_instance" "instance_terraform" {
    ami = data.aws_ami.gana.id
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.sg_terraform.id]
    tags = {
        Name = "terraform"
    }
}


# To create Security group
resource "aws_security_group" "sg_terraform" {
    name = "Allow SSH"
    description = "Allow SSH protocal 22"

    #inbound rule
    ingress{
        description = "Allow port number 22"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    #outbound rule
    egress{
        description = "Allow all"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "Allow_SSH"
    }
}

