variable "aws_access_key" {
    type = string
    description = "AWS Access Key"
    sensitive = true
}

variable "aws_secret_key" {
    type = string
    description = "AWS Secret Key"
    sensitive = true
}

variable "region" {
    type = string
    description = "AWS Region to use"
    sensitive = false
    default = "eu-west-1"
}

variable "enable_dns_hostnames" {
    type = bool
    description = "Enable DNS hostnames in VPC"
    default = true
}

variable "vpc_cidr_block" {
    type = string
    description = "Base CIDR block for VPC"
    default = "10.0.0.0/16"
}

variable "vpc_pub_sub_cidr_block" {
    type = string
    description = "CIDR block for Subnet 1"
    default = "10.0.0.0/24"
}

variable "map_public_ip_on_launch" {
    type = bool
    description = "Map public IP for subnet associations"
    default = true
}

variable "company" {
  type = string
  description = "Company name for resource tagging"
  default = "Infosys"
}

variable "project" {
  type = string
  description = "Project name for resource tagging"
  default = "Project-Template"
}
