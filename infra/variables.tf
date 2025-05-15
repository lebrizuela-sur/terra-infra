variable "aws_region" {
  default = "us-east-1"
}

variable "environment" {
  description = "Nombre del entorno (dev, qa, predev, prod)"
  type        = string
}
