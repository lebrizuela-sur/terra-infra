resource "aws_glue_job" "job" {
  name     = var.name
  role_arn = var.role_arn

  command {
    name            = "glueetl"
    python_version  = "3"
    script_location = var.script_location
  }

  glue_version      = "4.0"
  execution_class = "STANDARD"

  number_of_workers = var.max_capacity
  worker_type       = "G.1X"

  default_arguments = merge(
    var.default_arguments,
    {
      "--job-language" = "python"
      "--TempDir"      = "s3://${var.temp_bucket}/temporary/"
    }
  )


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
