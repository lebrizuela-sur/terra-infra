resource "aws_glue_job" "job" {
  name     = var.name
  role_arn = var.role_arn
  command {
    name            = "glueetl"
    script_location = var.script_location
    python_version  = "3"
  }
  glue_version       = "4.0"
  number_of_workers  = 2
  worker_type        = "G.1X"
  default_arguments = var.default_arguments
  notebook_path = var.notebook_path

}
