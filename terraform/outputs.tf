output "private_key_filename" {
  value     = local_file.pem.filename
  sensitive = true
}

output "instance_ip_addr" {
  value = aws_instance.ec2.public_ip
}

output "s3_bucket_name" {
  value = aws_s3_bucket.my_bucket.bucket
}
