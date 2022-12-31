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
    start = "cron(0 10 ? * * *)"
    stop  = "cron(00 21 ? * * *)"
  }
}

variable "lambda_env" {
  default = {
    KEY   = "schedule"
    VALUE = "true"
  }
}
