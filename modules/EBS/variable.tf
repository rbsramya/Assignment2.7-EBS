variable "instance_id" {
  description = "ID of the EC2 instance to attach the EBS volume to"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone for the EBS volume"
  type        = string
}