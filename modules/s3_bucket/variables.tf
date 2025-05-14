variable "name" {
  description = "Nombre del bucket"
  type        = string
}

variable "tags" {
  description = "Tags opcionales"
  type        = map(string)
  default     = {}
}
