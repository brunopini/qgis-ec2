variable "vnc_password" {
  type      = string
  sensitive = true
}

variable "region" {
  description = "AWS region."
  type = string
  default = "sa-east-1"  # Choose something close to you
}

variable "instance_type" {
  description = "The instance type of the EC2 instance."
  type        = string
  default     = "t3.2xlarge"  # Decrease if job is not resource intensive
}

variable "ami" {
  description = "The EC2 ami."
  type        = string
  default     = "ami-0e83bcafd049ec20c"  # Find region-specific ami for Ubuntu 22.04 LTS https://cloud-images.ubuntu.com/locator/ec2/
}

variable "bucket_name" {
    description = "Name of the s3 bucket attached to ec2."
    type = string
    default = "qgis-bucket"  # You will need a unique name for your bucket
}

variable "ec2_tag" {
    type = string
    default = "qgis"  # Name your ec2 instance
}

variable "ec2_key_dir" {
    type = string
    description = "Path to the key pair directory (ommit `/`)"
    default = "../.keys"  # Keep as is
}

variable "pem_name" {
    type = string
    description = "Mame of the key pair created."
    default = "qgis-ec2"  # SSH key name
}

variable "ec2_username" {
  description = "Username of ec2 instance for ssh"
  type = string
  default = "ubuntu"
}
