output "vpc_id" {
  description = "The ID of the created VPC"
  value       = aws_vpc.demo_vpc.id
}

output "subnet_id" {
  description = "The ID of the created Subnet"
  value       = aws_subnet.demo_subnet.id
}

output "instance_id" {
  description = "The ID of the created EC2 instance"
  value       = aws_instance.demo_server.id
}

output "instance_public_ip" {
  description = "The public IP of the created EC2 instance"
  value       = aws_instance.demo_server.public_ip
}
