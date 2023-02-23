variable "ami_id" {
  default = ""
  description = "Ami Id" 
}

variable "instance_type" {
  
}

variable "tags" {
  default = { Environment = "Dev", CreatedBy = "terraform"}    
}

variable "sg_name" {
  
}

variable "ingress_rules" {
  
}