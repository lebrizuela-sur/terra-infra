variable "name" { type = string }
variable "script_location" { type = string }
variable "role_arn" { type = string }
variable "temp_bucket" { type = string }

variable "enable_continuous_logging" { type = bool }
variable "enable_glue_datacatalog" { type = bool }
variable "enable_job_metrics" { type = bool }
variable "enable_job_insights" { type = bool }
variable "max_capacity" { type = number }

variable "notebook_path" {
  description = "Optional path to a Glue notebook (Jupyter)"
  type        = string
  default     = null
}


variable "default_arguments" {
  description = "Map of default arguments for the Glue job"
  type        = map(string)
}


variable "tags" {
  type    = map(string)
  default = {}
}

variable "schedule_cron_expression" {
  type    = string
  default = null
}
