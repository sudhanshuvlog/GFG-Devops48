# output "instance_public_ip" {
#     value = aws_instance.gfg-ec2.public_ip
# }

# output "instance_public_ip_1" {
#     value = aws_instance.gfg-ec2-1.public_ip
# }

output "first_instance_public_ip" {
    value = aws_instance.gfg-ec2[0].public_ip
}

output "second_instance_public_ip" {
    value = aws_instance.gfg-ec2[1].public_ip
}
