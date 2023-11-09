# locals {
#   ssh_command = "ssh -i '../.keys/${var.pem_name}' ${var.ec2_username}@${aws_instance.ec2.instance_dns}"
# }