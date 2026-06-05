variable "ami_id" {
  description = "AMI ID for EC2 instances"
  default = "ami-0c7217cdde317cfec"
}

variable "instance_type" {
  description = "EC2 instance type"
  default = "t2.micro"
}

variable "public_subnet_id" {
  description = "Public subnet ID"
  type = string
}


variable "private_subnet_id" {
  description = "Private subnet ID"
  type        = string
  default     = ""
}

variable "key_name" {
  description = "SSH key pair name"
  type = string
}

variable "app_sg_id" {
  description = "Security group ID for server"
  type = string
}

variable "env_name" {
  description = "Enviroment name"
  type = string
}

