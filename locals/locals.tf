locals {
    zone_id = "Z05572863J5M0XIZ925CW"
    domain_name = "poojitha.online"
    #count.index will not work 
     instance_type = var.environment == "prod" ? "t3.medium" : "t3.micro"
}

