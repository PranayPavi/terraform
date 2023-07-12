#cloud provicer
variable "aws_region" {
  description = "AWS region"
  type = string
}

variable "aws_access_key" {
  description = "AWS access key"
  type = string
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type = string
}

#VPC
variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type        = string
}

variable "public_subnet_cidr_blocks" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  }

variable "private_subnet_cidr_blocks" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "Availability zones for subnets"
  type        = list(string)
}

variable "sg_name" {
  type = string
}

variable "sg_ingress_ports" {
  description = "Ingress ports for security group"
  type        = list(number)
}

variable "sg_egress_ports" {
  description = "Egress ports for security group"
  type        = list(number)
}

variable "sg_cidr_blocks" {
  description = "CIDR blocks for security group"
  type        = list(string)
}


#S3 Bucket Public Access
variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "s3_tags" {
  description = "Tags for the S3 bucket"
  type        = map(string)
}

variable "block_public_acls" {
  description = "Flag to block public ACLs on the S3 bucket"
  type        = bool
}

variable "block_public_policy" {
  description = "Flag to block public policies on the S3 bucket"
  type        = bool
}

variable "ignore_public_acls" {
  description = "Flag to ignore public ACLs on the S3 bucket"
  type        = bool
}

variable "restrict_public_buckets" {
  description = "Flag to restrict public access to the S3 bucket"
  type        = bool
}

variable "s3_versioning_status" {
  description = "Status of S3 bucket versioning"
  type        = string
}

#EC2 Instance
variable "ami_id" {
  description = "ID of the AMI"
  type        = string
}

variable "instance_type" {
  description = "Type of the EC2 instance"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet where the EC2 instance will be launched"
  type        = string
}

variable "key_name" {
  description = "Name of the key pair used for SSH access to the EC2 instance"
  type        = string
}
/*
variable "security_group_ids" {
  description = "List of security group IDs associated with the EC2 instance"
  type        = list(string)
}
*/
variable "instance_tags" {
  description = "Tags for the EC2 instance"
  type        = map(string)
}

#Internet Gateway
variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "internet_gateway_tags" {
  description = "Tags for the Internet Gateway"
  type        = map(string)
}

#NatGateway
variable "connectivity_type" {
  description = "Connectivity type for the NAT Gateway"
  type        = string
}

variable "nat_gateway_subnet_id" {
  description = "ID of the subnet where the NAT Gateway will be created"
  type        = string
}

variable "nat_gateway_tags" {
  description = "Tags for the NAT Gateway"
  type        = map(string)
}