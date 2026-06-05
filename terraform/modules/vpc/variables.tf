variable "vpc_cidr" {
  description = "CIDR block for VPC"
}

variable "env_name" {
  description = "Enviroment name e.g. staging"
}

variable "public_subnet_cidr" {
  description = "CIDR for public subnet"
}

variable "private_subnet_cidr" {
  description = "CIDR for private subnet"
}

variable "az" {
  description = "Availability zone"
  type = string
}

variable "project_name" {
  description = "Project name"
  type = string
}