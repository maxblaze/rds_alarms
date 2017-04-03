variable "name" {
  default = ""
}

variable "alarm_name" {
  default = ""
}

variable "comparison_operator" {
  default = "GreaterThanOrEqualToThreshold"
}

variable "evaluation_periods" {
  default = "3"
}

variable "namespace" {
  default = "AWS/RDS"
}

variable "period" {
  default = "300"
}

variable "statistic" {
  default = "Average"
}

variable "threshold" {
  default = ""
}

variable "unit" {
  default = ""
}

variable "alarm_description" {
  default = ""
}

variable "alarm_actions" {
  default = ["arn:aws:sns:us-east-1:615329498766:ct-users-anu"]
}
