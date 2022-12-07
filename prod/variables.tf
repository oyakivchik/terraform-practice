#### Network ####
variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = ""
}

variable "cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overriden"
  type        = string
  default     = "0.0.0.0/0"
}

variable "azs" {
  description = "A list of availability zones in the region"
  type        = list(string)
  default     = []
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "database_subnets" {
  description = "A list of database subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "enable_nat_gateway" {
  description = "Create NAT Gateway or not"
  type        = bool
  default     = false
}

variable "single_nat_gateway" {
  description = "Create only one NAT Gateway or not"
  type        = bool
  default     = true
}

variable "one_nat_gateway_per_az" {
  description = "Create one NAT Gateway per AZ or not"
  type        = bool
  default     = false
}

#### Compute ####
variable "key_name" {
  description = "Name of the keypair"
  type        = string
  default     = "default"
}

variable "public_key" {
  description = "Public SSH key"
  type        = string
  default     = ""
}

variable "ami" {
  description = "AMI for EC2"
  type        = string
  default     = ""
}

variable "alb_name" {
  description = "ALB name"
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "Instance type for EC2"
  type        = string
  default     = ""
}

variable "instance_dict" {
  description = "Map of instance attributes"
  type        = list(map(string))
  default     = []
}

#### DB ####
variable "identifier" {
  description = "DB identifier"
  type        = string
  default     = ""
}

variable "engine" {
  description = "DB engine"
  type        = string
  default     = ""
}

variable "engine_version" {
  description = "DB engine version"
  type        = string
  default     = ""
}

variable "instance_class" {
  description = "DB instance class"
  type        = string
  default     = ""
}

variable "allocated_storage" {
  description = "DB allocated storage"
  type        = number
  default     = 5
}

variable "db_name" {
  description = "DB name"
  type        = string
  default     = ""
}

variable "username" {
  description = "DB username"
  type        = string
  default     = ""
}

variable "port" {
  description = "DB port"
  type        = string
  default     = ""
}

variable "family" {
  description = "DB family"
  type        = string
  default     = ""
}

variable "major_engine_version" {
  description = "DB major engine version"
  type        = string
  default     = ""
}

variable "deletion_protection" {
  description = "DB deletion protection"
  type        = bool
  default     = false
}

variable "parameters" {
  description = "Map of DB parameters"
  type        = list(map(string))
  default     = []
}