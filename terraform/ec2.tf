resource "aws_instance" "ec2" {
  ami             = var.ami
  instance_type   = var.instance_type
  iam_instance_profile = aws_iam_instance_profile.s3_access_profile.name
  key_name        = aws_key_pair.pem.key_name
  security_groups = [aws_security_group.allow_vnc.name]

  associate_public_ip_address = true

  tags = {
    Name = var.ec2_tag
  }
}
