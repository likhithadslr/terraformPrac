variable "instances" {
    type    = map 
    default = {
        mysql = "t3.small"
        backend = "t3.micro"
        frontend = "t3.micro"
    }
}

variable "zone_id" {
  default = "Z05572863J5M0XIZ925CW"
}

variable "domain_name" {
  default = "poojitha.online"
}