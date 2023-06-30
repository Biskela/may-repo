# REGION VARIABLE
variable "Provider-region" {
  default     = "eu-west-2"
  description = "AWS-region"
}

# VPC CIDR VARIABLE
variable "Vpc-cidr" {
  default     = "10.0.0.0/16"
  description = "Vpc-cidr-block"
}


# PUBLIC CIDR VARIABLE
variable "Prod-pub-sub-1-cidr" {
  default     = "10.0.1.0/24"
  description = "Prob-pub-sub-1-cidr"
}


# PUBLIC CIDR VARIABLE
variable "Prod-pub-sub-2-cidr" {
  default     = "10.0.2.0/24"
  description = "Prob-pub-sub-2-cidr"
}


# PRIVATE CIDR VARIABLE
variable "Prod-pri-sub-1-cidr" {
  default     = "10.0.3.0/24"
  description = "Prob-pri-sub-1-cidr"
}


# PRIVATE CIDR VARIABLE
variable "Prod-pri-sub-2-cidr" {
  default     = "10.0.4.0/24"
  description = "Prob-pri-sub-2-cidr"
}










