resource "aws_instance" "expense" {
    for_each = var.instances #this variable is map
    #for-each will give us a sepcial var with name each
    ami = "ami-09c813fb71547fc4f"
    instance_type = each.value
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
    tags = {
    Name = each.key
    }
}

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
