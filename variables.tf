variable "project" {
  default = "lambda-manager-ec2"
}

variable "profile" {
  default = "default"
}

variable "lambda_timeout" {
  default = 600
}

variable "tags" {
  default = {
    Name    = "lambda-manager-ec2"
    Product = "lambda"
    Team    = "sre"
  }
}

variable "sched_expr" {
  default = {
    start = "cron(0 07 ? * * *)"
    stop  = "cron(45 10 ? * * *)"
  }
}

variable "lambda_env" {
  default = {
    KEY   = "automate"
    VALUE = "Auto-Shutdown"
  }
}
