variable "aws_region" {
  description = "The AWS region to create things in."
  default = "us-east-2"
}

variable "availability_zones" {
  default = "us-east-2b,us-east-2c,us-east-2a"
  description = "List of availability zones, use AWS CLI to find your "
}

variable "key_name" {
  default = "deploy"
  description = "Name of AWS key pair"
}

variable "public_key_path" {
  default = "~/.ssh/deploy.pem"
  description = "Path to public key file"
}

variable "instance_type" {
  default = "t2.micro"
  description = "AWS instance type"
}

variable "ami" {
  default = "ami-accde0c9"
}

## Tags

variable "role" {
  default = "web server"
}

variable "hostname" {
  default = "Jenkins-Test"
}

variable "fqdn" {
  default = "staging.site.dev.rig.net"
}
