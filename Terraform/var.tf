variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
} 

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "gfg-48-vpc"
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "The CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}   

variable "public-subnet-az" {
  description = "The availability zone for the public subnet"
  type        = string
  default     = "ap-south-1a"
}

variable "private-subnet-az" {
  description = "The availability zone for the private subnet"
  type        = string
  default     = "ap-south-1b"
}

variable "route_table_allowed_cidr" {
  description = "The allowed CIDR block for the route table"
  type        = string
  default     = "0.0.0.0/0"
}

variable "ami_id" {
  description = "The ID of the AMI to use for the EC2 instance"
  type        = string
  default     = "ami-022374b883d9d7931"
}

variable "instance_type" {
  description = "The type of instance to use for the EC2 instance"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "The name of the key pair to use for the EC2 instance"
  type        = string
  default     = "DevOps"
}

variable "subnet_id" {
  description = "The ID of the subnet to launch the EC2 instance in"
  type        = string
  default     = "subnet-04c1ed6ba9c55ffd7"
}

variable "security_group_id" {
  description = "The ID of the security group to associate with the EC2 instance"
  type        = string
  default     = "sg-0fc30dede114a834f"
}

variable "allowed_inbound_ports" {
  description = "List of allowed inbound ports for the security group"
  type        = list(number)
  default     = [80, 443, 8080, 22, 3306, 5432, 6379, 27017, 9200, 9300, 11211, 8081, 5000, 8000, 8888, 9000, 27018, 27019, 27020, 27021, 27022, 27023, 27024, 27025, 27026, 27027, 27028, 27029, 27030]
}