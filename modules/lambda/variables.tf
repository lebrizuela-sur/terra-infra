variable "function_name" { type = string }
variable "role_arn"      { type = string }
variable "runtime"       { type = string }
variable "handler"       { type = string }
variable "filename"      { type = string }

variable "layers" {
  type    = list(string)
  default = []
}
