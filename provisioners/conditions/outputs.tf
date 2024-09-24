output "public_ip" {
    value       = aws_instance.terraform.public_ip
    sensitive   = false 
    description = "This is public IP of instance created"
    
}