variable "region" {
  description = "AWS region."
  type = string
  default = "sa-east-1"
}

variable "instance_type" {
  description = "The instance type of the EC2 instance."
  type        = string
  default     = "t3.medium"
}

variable "ami" {
  description = "The EC2 ami."
  type        = string
  default     = "ami-0e83bcafd049ec20c"
}

variable "bucket_name" {
    description = "Name of the s3 bucket attached to ec2."
    type = string
    default = "qbis-bucket"
  
}

variable "ec2_tag" {
    type = string
    default = "qbis"
}

variable "ec2_key_dir" {
    type = string
    description = "Absolute path to the key pair directory (ommit `/`)"
    default = "../.keys"
}

variable "pem_name" {
    type = string
    description = "Mame of the key pair created."
    default = "qbis-ec2"
}
