resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "pem" {
  key_name   = var.pem_name
  public_key = tls_private_key.key.public_key_openssh
}

resource "local_file" "pem" {
  content         = tls_private_key.key.private_key_pem
  filename        = "${var.ec2_key_dir}/${var.pem_name}.pem"
  file_permission = "0600"
}
