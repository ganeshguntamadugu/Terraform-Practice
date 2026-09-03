# To create ec2-instance
resource "aws_instance" "instance_terraform" {
    ami = "ami-0220d79f3f480ecf5"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.sg_terraform.id]
    tags = {
        Name = "terraform"
    }

    #Local
    provisioner "local-exec" {
        command = "echo ${self.private_ip} ${self.public_ip} > IPs.txt"
    }

    #Remote
    connection {
        type     = "ssh"
        user     = "ec2-user"
        password = "DevOps321"
        host     = self.public_ip
    }
    provisioner "remote-exec" {
        inline = [
            "sudo dnf install ansible -y",
            "sudo dnf install nginx -y",
            "sudo systemctl start nginx"
        ]
    }
    provisioner "remote-exec" {
        when = destroy
        inline = [
            "sudo systemctl stop nginx"
        ]
    }
}


# To create Security group
resource "aws_security_group" "sg_terraform" {
    name = "Allow HTTP & SSH"
    description = "Allow HTTP protocal 80 & 22"

    #inbound rule
    ingress{
        description = "Allow port number 22"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress{
        description = "Allow port number 80"
        from_port = 80
        to_port = 80
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
        Name = "Allow_HTTP"
    }
}

