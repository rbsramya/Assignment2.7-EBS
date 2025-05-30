resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdb"
  volume_id   = aws_ebs_volume.ebs_volume.id
  instance_id = var.instance_id

}

resource "aws_ebs_volume" "ebs_volume" {
  availability_zone = var.availability_zone
  type = "gp3"
  iops = 3000
  throughput = 125
  size              = 1
  tags = {
    Name = "RamyaEBS"
  }
}