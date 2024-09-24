variable "ingress_rules" {
    default = [
        {
            from_port        = 22
            to_port          = 22
            protocol         = "tcp"   # ssh etc are part of tcp
            cidr_blocks      = ["0.0.0.0/0"]  # allow from everywhere
            description      = "opening 22"
        },
        {
            from_port        = 80
            to_port          = 80
            protocol         = "tcp"   # ssh etc are part of tcp
            cidr_blocks      = ["0.0.0.0/0"]  # allow from everywhere
            description      = "opening 80"                                                                                                    
        },
        {
            from_port        = 8080
            to_port          = 8080
            protocol         = "tcp"   # ssh etc are part of tcp
            cidr_blocks      = ["0.0.0.0/0"]  # allow from everywhere
            description      = "opening 8080"                                                                                                    
        }
    ]
}