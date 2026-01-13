variable "allowed_ip_range" {
  description = "Lista de intervalos de IP permitidos para acesso seguro."
  type        = list(string)
}

variable "vpc_id" {
  description = "ID da VPC existente."
  type        = string
}

variable "public_instance_id" {
  description = "ID da instância EC2 pública."
  type        = string
}

variable "private_instance_id" {
  description = "ID da instância EC2 privada."
  type        = string
}

variable "project_id" {
  description = "ID do projeto para tagging."
  type        = string
}
