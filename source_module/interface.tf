variable "name" {
  default = "duolingo-contest"
}

variable "alarm_name" {
  default = "Storage_Alarm"
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

variable "memory" {
  default = {
    db.t2.micro = "800000000"
    db.t1.micro = "492000000"
    db.m1.small = "1360000000"
    db.m4.large = "6400000000"
    db.m4.xlarge = "12800000000"
    db.m4.2xlarge = "25600000000"
    db.m4.4xlarge = "51200000000"
    db.m4.10xlarge = "128000000000"
    db.r3.large = "12000000000"
    db.r3.xlarge = "24400000000"
    db.r3.2xlarge = "48800000000"
    db.r3.4xlarge = "97600000000"
    db.r3.8xlarge = "195200000000"
    db.t2.small = "1600000000"
    db.t2.medium = "3200000000"
    db.t2.large = "6400000000"
    db.m3.medium = "3000000000"
    db.m3.large = "6000000000"
    db.m3.xlarge = "12000000000"
    db.m3.2xlarge = "24000000000"
    db.m1.small = "1360000000"
    db.m1.medium = "3000000000"
    db.m1.large = "6000000000"
    db.m1.xlarge = "12000000000"
    db.m2.xlarge = "13680000000"
    db.m2.2xlarge = "27360000000"
    db.m2.4xlarge = "54720000000"
  }
}

variable "max_connections" {
  default = "0" 
}

variable "max_read_iops" {
  default = "0"
}

variable "max_write_iops" {
  default = "0"
}

variable "storagespace_threshold" {
  default = "0"
}

variable "freememory_threshold" {
  default = "0"
}

variable "swap_limit" {
  default = "0"
}

variable "bandwidth" {
  default = {
    db.t2.micro = "65000000"
    db.t1.micro = "100000000"
    db.m4.large = "450000000"
    db.m4.xlarge = "750000000"
    db.m4.2xlarge = "1000000000"
    db.m4.4xlarge = "2000000000"
    db.m4.10xlarge = "4000000000"
    db.r3.large = "400000000"
    db.r3.xlarge = "800000000"
    db.r3.2xlarge = "1600000000"
    db.r3.4xlarge = "3000000000"
    db.r3.8xlarge = "6000000000"
    db.t2.small = "125000000"
    db.t2.medium = "250000000"
    db.t2.large = "500000000"
    db.m3.medium = "125000000"
    db.m3.large = "250000000"
    db.m3.xlarge = "500000000"
    db.m3.2xlarge = "1000000000"
    db.m1.small = "100000000"
    db.m1.medium = "250000000"
    db.m1.large = "500000000"
    db.m1.xlarge = "1000000000"
    db.m2.xlarge = "250000000"
    db.m2.2xlarge = "500000000"
    db.m2.4xlarge = "1000000000"
  }
}

variable "max_network_in" {
  default = "0"
}

variable "max_network_out" {
  default = "0"
}

variable "max_read_latency" {
  default = "0"
}

variable "max_write_latency" {
  default = "0"
}

variable "read_throughput" {
  default = "0"
}

variable "write_throughput" {
  default = "0"
}

variable "max_disk_queue" {
  default = "0"
}

variable "max_cpu" {
  default = "0"
}

variable "max_binlog" {
  default = "0"
}

variable "min_credits" {
  default = "0"
}

variable "credits" {
  default = {
    "db.t2.micro" = "50"
    "db.t2.small" = "100"
    "db.t2.medium" = "200"
    "db.t2.large" = "400"
  }
}
