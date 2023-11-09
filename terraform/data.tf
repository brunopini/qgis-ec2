data "aws_vpc" "default" {
  default = true
}

data "template_file" "qgis_vnc" {
  template = "${file("${path.module}/qgis_vnc.tpl")}"

  vars = {
    mount_bucket = var.bucket_name
    vnc_password = var.vnc_password
    mount_s3_script     = file("${path.module}/../bin/mount_s3.sh")
    vnc_desktop_script  = file("${path.module}/../bin/vnc_desktop.sh")
    qgis_script         = file("${path.module}/../bin/qgis.sh")
  }
}
