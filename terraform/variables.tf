variable "aws_region" {
  description = "Configuring AWS as provider"
  type        = string
  default     = "us-east-1"
}

variable "app_prefix" {
  description = "Prefix for application resources"
  type        = string
  default     = "aurora"
}


variable "default_tags" {
  default = {

    managed_by = "terraform"
  }
  description = "default tags"
  type        = map(string)
}

variable "vpc_cidr" {
  description = "CIDR block for main"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

