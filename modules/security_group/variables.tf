variable "name" {
  type = string
}

variable "description" {
  type = string
  default = ""
}

variable "vpc_id" {
  type = string
}



variable "tags" {
  type    = map(string)
  default = {}
}


variable "allow_from_sg" {
  type        = list(string)
  default     = []
  description = "Lista de SGs que tendrán permiso de ingreso"
}
