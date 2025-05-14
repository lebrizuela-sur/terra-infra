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

variable "allow_from_sg" {
  type = list(string)
}

variable "tags" {
  type    = map(string)
  default = {}
}
