variable "region" {
  description = "AWS Region"
  default     = "eu-north-1"
}

variable "instance_type" {
  description = "EC2 Instance Type"
  default     = "t3.micro"
}

variable "key_name" {
  description = "Existing EC2 Key Pair name"
}