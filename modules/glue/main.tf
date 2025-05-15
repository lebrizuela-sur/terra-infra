resource "aws_glue_job" "job" {
  name     = var.name
  role_arn = var.role_arn

  command {
    name            = "glueetl"
    python_version  = "3"
    script_location = var.script_location
  }

  glue_version      = "4.0"
  number_of_workers = var.max_capacity
  worker_type       = "G.1X"

  default_arguments = var.default_arguments

  execution_property {
    max_concurrent_runs = 1
  }

  tags = var.tags
}

resource "aws_glue_trigger" "schedule" {
  count = var.schedule_cron_expression != null ? 1 : 0

  name     = "${var.name}-trigger"
  type     = "SCHEDULED"
  schedule = var.schedule_cron_expression
  enabled  = true

  actions {
    job_name = aws_glue_job.job.name
  }
}
