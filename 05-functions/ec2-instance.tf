# To create ec2-instance
# Functions
resource "aws_instance" "ansible" {
    #count = 3 #Here it will create 3 similar ec2-instance
    count = length(var.instance_names) #Here length is a function it will create based on the length of the list
    ami = "ami-0220d79f3f480ecf5"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.sg_terraform.id]
    tags = merge( #This is function
        var.common_tags,
        {
            Name = var.instance_names[count.index] #Here it will create 3 different instance using count.index
        }
    )
}

#To create Security group
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

    tags = merge( #This is function
        var.common_tags,
        {
            Name = "terraform-practice"
        }
    )
}

