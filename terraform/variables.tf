variable "aws_region" {
  description = "Configuring AWS as provider"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for main"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones_az1" {
  type    = string
  default = "us-east-1a"
}

variable "availability_zones_az2" {
  type    = string
  default = "us-east-1b"
}

variable "availability_zones_az3" {
  type    = string
  default = "us-east-1c"
}

variable "app_prefix" {
    type    = string
  default = "devops-teste"
}