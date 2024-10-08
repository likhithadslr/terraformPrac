resource "aws_security_group" "allow_ssh_terraform"{
    name = "allow_sshh"
    description = "Allow port 22 for SSH access"

    
    egress {
        from_port        =0
        to_port          =0
        protocol         ="-1"  # -1 means everything
        cidr_blocks      =["0.0.0.0/0"]
        ipv6_cidr_blocks =["::/0"]
    
    }

    ingress  {
        from_port        =22
        to_port          =22
        protocol         ="tcp"   # ssh etc are part of tcp
        cidr_blocks      =["0.0.0.0/0"]  # allow from everywhere
        ipv6_cidr_blocks =["::/0"]
    }

    tags = {
        Name = "allow_sshh"
    }
}
resource "aws_instance" "terraform" {
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
    tags = {
    Name = "terraform"
    }

    provisioner "local-exec" {
        command = "echo ${self.private_ip} > public_ip.txt "
    }

    connection {
        type  = "ssh"
        user  = "ec2-user"
        password = "DevOps321"
        host     = self.public_ip
    }

    provisioner "remote-exec" {
        inline = [  #inline means u can run multiple commands 
            "sudo dnf install ansible -y",
            "sudo dnf install nginx -y",
            "sudo systemctl start nginx"
        ]
    }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
}