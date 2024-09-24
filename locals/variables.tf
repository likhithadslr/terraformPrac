variable "instance_names" {
  type    = list(string)
  default = ["mysql", "backend", "frontend"]
}

# variable "zone_id" {
#   default = "Z05572863J5M0XIZ925CW"
# }

# variable "domain_name" {
#   default = "poojitha.online"
# }

variable "environment" {
    default = "prod"
}