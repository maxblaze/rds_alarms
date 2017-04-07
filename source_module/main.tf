data "aws_db_instance" "database" {
  db_instance_identifier = "${var.name}"
}

resource "aws_cloudwatch_metric_alarm" "alarm_rds_CPU" {
  alarm_name = "${var.name}_alarm_rds_CPU"
  comparison_operator = "${var.comparison_operator}"
  evaluation_periods = "${var.evaluation_periods}"
  metric_name = "CPUUtilization"
  namespace = "${var.namespace}"
  period = "${var.period}"
  statistic = "${var.statistic}"
  threshold = "${var.max_cpu == 0 ? "80.0" : "${var.max_cpu}"}"
  unit = "Percent"
  alarm_description = ""
  alarm_actions = "${var.alarm_actions}"
  dimensions {
      DBInstanceIdentifier = "${var.name}"
  }
}

resource "aws_cloudwatch_metric_alarm" "alarm_rds_StorageSpace" {
  alarm_name = "alarm_rds_StorageSpace"
  comparison_operator = "${var.comparison_operator}"
  evaluation_periods = "${var.evaluation_periods}"
  metric_name = "FreeStorageSpace"
  namespace = "${var.namespace}"
  period = "${var.period}"
  statistic = "${var.statistic}"
  threshold = "${var.storagespace_threshold == 0 ? "${800000000 * data.aws_db_instance.database.allocated_storage}" : "${var.storagespace_threshold}" }"
  alarm_description = ""
  alarm_actions = "${var.alarm_actions}"
  dimensions {
      DBInstanceIdentifier = "${var.name}"
  }
}

resource "aws_cloudwatch_metric_alarm" "alarm_rds_FreeableMemory" {
  alarm_name = "${var.name}_alarm_rds_FreeableMemory"
  comparison_operator = "${var.comparison_operator}"
  evaluation_periods = "${var.evaluation_periods}"
  metric_name = "FreeableMemory"
  namespace = "${var.namespace}"
  period = "${var.period}"
  statistic = "${var.statistic}"
  threshold = "${var.freememory_threshold == 0 ? "${var.memory[data.aws_db_instance.database.db_instance_class]}" : "${var.freememory_threshold}" }"
  alarm_description = ""
  alarm_actions = "${var.alarm_actions}"
  dimensions {
      DBInstanceIdentifier = "${var.name}"
  }
}

resource "aws_cloudwatch_metric_alarm" "alarm_rds_DatabaseConnections" {
  alarm_name = "${var.name}_alarm_rds_DatabaseConnections"
  comparison_operator = "${var.comparison_operator}"
  evaluation_periods = "${var.evaluation_periods}"
  metric_name = "DatabaseConnections"
  namespace = "${var.namespace}"
  period = "${var.period}"
  statistic = "${var.statistic}"
  threshold = "${var.max_connections == 0 ? "${var.memory[data.aws_db_instance.database.db_instance_class]/14380434}" : "${var.max_connections}"}"
  alarm_description = ""
  alarm_actions = "${var.alarm_actions}"
  dimensions {
      DBInstanceIdentifier = "${var.name}"
  }
}

resource "aws_cloudwatch_metric_alarm" "alarm_rds_WriteIOPS" {
  alarm_name = "${var.name}_alarm_rds_WriteIOPS"
  comparison_operator = "${var.comparison_operator}"
  evaluation_periods = "${var.evaluation_periods}"
  metric_name = "WriteIOPS"
  namespace = "${var.namespace}"
  period = "${var.period}"
  statistic = "${var.statistic}"
  threshold = "${var.max_write_iops == 0 ? "${data.aws_db_instance.database.iops * 0.6}" : "${var.max_write_iops}"}"
  alarm_description = ""
  alarm_actions = "${var.alarm_actions}"
  dimensions {
      DBInstanceIdentifier = "${var.name}"
  }
  count = "${data.aws_db_instance.database.storage_type == "io1" ? "1" : "0"}"
}

resource "aws_cloudwatch_metric_alarm" "alarm_rds_ReadIOPS" {
  alarm_name = "${var.name}_alarm_rds_ReadIOPS"
  comparison_operator = "${var.comparison_operator}"
  evaluation_periods = "${var.evaluation_periods}"
  metric_name = "ReadIOPS"
  namespace = "${var.namespace}"
  period = "${var.period}"
  statistic = "${var.statistic}"
  threshold = "${var.max_read_iops == 0 ? "${data.aws_db_instance.database.iops * 0.6}" : "${var.max_read_iops}"}"
  alarm_description = ""
  alarm_actions = "${var.alarm_actions}"
  dimensions {
      DBInstanceIdentifier = "${var.name}"
  }
  count = "${data.aws_db_instance.database.storage_type == "io1" ? "1" : "0"}"
}

resource "aws_cloudwatch_metric_alarm" "alarm_rds_WriteIOPS_burst" {
  alarm_name = "${var.name}_alarm_rds_WriteIOPS_burst"
  comparison_operator = "${var.comparison_operator}"
  evaluation_periods = "${var.evaluation_periods}"
  metric_name = "WriteIOPS"
  namespace = "${var.namespace}"
  period = "120"
  statistic = "${var.statistic}"
  threshold = "2400.0"
  alarm_description = ""
  alarm_actions = "${var.alarm_actions}"
  dimensions {
      DBInstanceIdentifier = "${var.name}"
  }
  count = "${data.aws_db_instance.database.storage_type == "gp2" ? "1" : "0"}"
}

resource "aws_cloudwatch_metric_alarm" "alarm_rds_ReadIOPS_burst" {
  alarm_name = "${var.name}_alarm_rds_ReadIOPS_burst"
  comparison_operator = "${var.comparison_operator}"
  evaluation_periods = "${var.evaluation_periods}"
  metric_name = "ReadIOPS"
  namespace = "${var.namespace}"
  period = "120"
  statistic = "${var.statistic}"
  threshold = "2400.0"
  alarm_description = ""
  alarm_actions = "${var.alarm_actions}"
  dimensions {
      DBInstanceIdentifier = "${var.name}"
  }
  count = "${data.aws_db_instance.database.storage_type == "gp2" ? "1" : "0"}"
}

resource "aws_cloudwatch_metric_alarm" "alarm_rds_WriteIOPS_general" {
  alarm_name = "${var.name}_alarm_rds_WriteIOPS_general"
  comparison_operator = "${var.comparison_operator}"
  evaluation_periods = "${var.evaluation_periods}"
  metric_name = "WriteIOPS"
  namespace = "${var.namespace}"
  period = "${var.period}"
  statistic = "${var.statistic}"
  threshold = "${var.max_write_iops == 0 ? "${data.aws_db_instance.database.allocated_storage * 1.8}" : "${var.max_write_iops}"}"
  alarm_description = ""
  alarm_actions = "${var.alarm_actions}"
  dimensions {
      DBInstanceIdentifier = "${var.name}"
  }
  count = "${data.aws_db_instance.database.storage_type == "gp2" ? "1" : "0"}"
}

resource "aws_cloudwatch_metric_alarm" "alarm_rds_ReadIOPS_general" {
  alarm_name = "${var.name}_alarm_rds_ReadIOPS_general"
  comparison_operator = "${var.comparison_operator}"
  evaluation_periods = "${var.evaluation_periods}"
  metric_name = "ReadIOPS"
  namespace = "${var.namespace}"
  period = "${var.period}"
  statistic = "${var.statistic}"
  threshold = "${var.max_read_iops == 0 ? "${data.aws_db_instance.database.allocated_storage * 1.8}" : "${var.max_read_iops}"}"
  alarm_description = ""
  alarm_actions = "${var.alarm_actions}"
  dimensions {
      DBInstanceIdentifier = "${var.name}"
  }
  count = "${data.aws_db_instance.database.storage_type == "gp2" ? "1" : "0"}"
}

resource "aws_cloudwatch_metric_alarm" "alarm_rds_WriteIOPS_magnetic" {
  alarm_name = "${var.name}_alarm_rds_WriteIOPS_magnetic"
  comparison_operator = "${var.comparison_operator}"
  evaluation_periods = "${var.evaluation_periods}"
  metric_name = "WriteIOPS"
  namespace = "${var.namespace}"
  period = "${var.period}"
  statistic = "${var.statistic}"
  threshold = "${var.max_write_iops == 0 ? "120.0" : "${var.max_write_iops}" }"
  alarm_description = ""
  alarm_actions = "${var.alarm_actions}"
  dimensions {
      DBInstanceIdentifier = "${var.name}"
  }
  count = "${data.aws_db_instance.database.storage_type == "standard" ? "1" : "0"}"
}

resource "aws_cloudwatch_metric_alarm" "alarm_rds_ReadIOPS_magnetic" {
  alarm_name = "${var.name}_alarm_rds_ReadIOPS_magnetic"
  comparison_operator = "${var.comparison_operator}"
  evaluation_periods = "${var.evaluation_periods}"
  metric_name = "ReadIOPS"
  namespace = "${var.namespace}"
  period = "${var.period}"
  statistic = "${var.statistic}"
  threshold = "${var.max_read_iops == 0 ? "120.0" : "${var.max_read_iops}" }"
  alarm_description = ""
  alarm_actions = "${var.alarm_actions}"
  dimensions {
      DBInstanceIdentifier = "${var.name}"
  }
  count = "${data.aws_db_instance.database.storage_type == "standard" ? "1" : "0"}"
}

resource "aws_cloudwatch_metric_alarm" "alarm_rds_SwapUsage" {
  alarm_name = "${var.name}_alarm_rds_SwapUsage"
  comparison_operator = "${var.comparison_operator}"
  evaluation_periods = "${var.evaluation_periods}"
  metric_name = "SwapUsage"
  namespace = "${var.namespace}"
  period = "${var.period}"
  statistic = "${var.statistic}"
  threshold = "${var.swap_limit == 0 ? "20000000.0" : "${var.swap_limit}"}"
  alarm_description = ""
  alarm_actions = "${var.alarm_actions}"
  dimensions {
      DBInstanceIdentifier = "${var.name}"
  }
}

resource "aws_cloudwatch_metric_alarm" "alarm_rds_NetworkIn" {
  alarm_name = "${var.name}_alarm_rds_NetworkIn"
  comparison_operator = "${var.comparison_operator}"
  evaluation_periods = "${var.evaluation_periods}"
  metric_name = "NetworkReceiveThroughput"
  namespace = "${var.namespace}"
  period = "${var.period}"
  statistic = "${var.statistic}"
  threshold = "${var.max_network_in == 0 ? "${0.8 * var.bandwidth[data.aws_db_instance.database.db_instance_class]}" : "${var.max_network_in}" }"
  alarm_description = ""
  alarm_actions = "${var.alarm_actions}"
  dimensions {
      DBInstanceIdentifier = "${var.name}"
  }
}

resource "aws_cloudwatch_metric_alarm" "alarm_rds_NetworkOut" {
  alarm_name = "${var.name}_alarm_rds_NetworkOut"
  comparison_operator = "${var.comparison_operator}"
  evaluation_periods = "${var.evaluation_periods}"
  metric_name = "NetworkTransmitThroughput"
  namespace = "${var.namespace}"
  period = "${var.period}"
  statistic = "${var.statistic}"
  threshold = "${var.max_network_out == 0 ? "${0.8 * var.bandwidth[data.aws_db_instance.database.db_instance_class]}" : "${var.max_network_out}" }"
  alarm_description = ""
  alarm_actions = "${var.alarm_actions}"
  dimensions {
      DBInstanceIdentifier = "${var.name}"
  }
}

resource "aws_cloudwatch_metric_alarm" "alarm_rds_ReadLatency" {
  alarm_name = "${var.name}_alarm_rds_ReadLatency"
  comparison_operator = "${var.comparison_operator}"
  evaluation_periods = "${var.evaluation_periods}"
  metric_name = "ReadLatency"
  namespace = "${var.namespace}"
  period = "${var.period}"
  statistic = "${var.statistic}"
  threshold = "${var.max_read_latency == 0 ? "0.03" : "${var.max_read_latency}"}"
  alarm_description = ""
  alarm_actions = "${var.alarm_actions}"
  dimensions {
      DBInstanceIdentifier = "${var.name}"
  }
}

resource "aws_cloudwatch_metric_alarm" "alarm_rds_WriteLatency" {
  alarm_name = "${var.name}_alarm_rds_WriteLatency"
  comparison_operator = "${var.comparison_operator}"
  evaluation_periods = "${var.evaluation_periods}"
  metric_name = "WriteLatency"
  namespace = "${var.namespace}"
  period = "${var.period}"
  statistic = "${var.statistic}"
  threshold = "${var.max_write_latency == 0 ? "0.03" : "${var.max_write_latency}"}"
  alarm_description = ""
  alarm_actions = "${var.alarm_actions}"
  dimensions {
      DBInstanceIdentifier = "${var.name}"
  }
}

resource "aws_cloudwatch_metric_alarm" "alarm_rds_ReadThroughput" {
  alarm_name = "${var.name}_alarm_rds_ReadThroughput"
  comparison_operator = "${var.comparison_operator}"
  evaluation_periods = "${var.evaluation_periods}"
  metric_name = "ReadThroughput"
  namespace = "${var.namespace}"
  period = "${var.period}"
  statistic = "${var.statistic}"
  threshold = "${var.read_throughput}"
  alarm_description = ""
  alarm_actions = "${var.alarm_actions}"
  dimensions {
      DBInstanceIdentifier = "${var.name}"
  }
  count = "${var.read_throughput == 0 ? "0" : "1"}"
}

resource "aws_cloudwatch_metric_alarm" "alarm_rds_WriteThroughput" {
  alarm_name = "${var.name}_alarm_rds_WriteThroughput"
  comparison_operator = "${var.comparison_operator}"
  evaluation_periods = "${var.evaluation_periods}"
  metric_name = "WriteThroughput"
  namespace = "${var.namespace}"
  period = "${var.period}"
  statistic = "${var.statistic}"
  threshold = "${var.write_throughput}"
  alarm_description = ""
  alarm_actions = "${var.alarm_actions}"
  dimensions {
      DBInstanceIdentifier = "${var.name}"
  }
  count = "${var.write_throughput == 0 ? "0" : "1"}"
}

resource "aws_cloudwatch_metric_alarm" "alarm_rds_DiskQueueDepth" {
  alarm_name = "${var.name}_alarm_rds_DiskQueueDepth"
  comparison_operator = "${var.comparison_operator}"
  evaluation_periods = "${var.evaluation_periods}"
  metric_name = "DiskQueueDepth"
  namespace = "${var.namespace}"
  period = "${var.period}"
  statistic = "${var.statistic}"
  threshold = "${var.max_disk_queue == 0 ? "10" : "${var.max_disk_queue}"}"
  alarm_description = ""
  alarm_actions = "${var.alarm_actions}"
  dimensions {
      DBInstanceIdentifier = "${var.name}"
  }
}

resource "aws_cloudwatch_metric_alarm" "alarm_rds_BinLogDiskUsage" {
  alarm_name = "${var.name}_alarm_rds_BinLogDiskUsage"
  comparison_operator = "${var.comparison_operator}"
  evaluation_periods = "${var.evaluation_periods}"
  metric_name = "BinLogDiskUsage"
  namespace = "${var.namespace}"
  period = "${var.period}"
  statistic = "${var.statistic}"
  threshold = "${var.max_binlog}"
  alarm_description = ""
  alarm_actions = "${var.alarm_actions}"
  dimensions {
      DBInstanceIdentifier = "${var.name}"
  }
  count = "${var.max_binlog == 0 ? "0" : "1"}"
}

resource "aws_cloudwatch_metric_alarm" "alarm_rds_CPUCreditBalance" {
  alarm_name = "${var.name}_alarm_rds_CPUCreditBalance"
  comparison_operator = "LessThanThreshold"
  evaluation_periods = "${var.evaluation_periods}"
  metric_name = "CPUCreditBalance"
  namespace = "${var.namespace}"
  period = "${var.period}"
  statistic = "${var.statistic}"
  threshold = "${var.min_credits == 0 ? "${var.credits[data.aws_db_instance.database.db_instance_class]}" : "${var.min_credits}"}"
  alarm_description = ""
  alarm_actions = "${var.alarm_actions}"
  dimensions {
      DBInstanceIdentifier = "${var.name}"
  }
  count = "${data.aws_db_instance.database.db_instance_class == "db.t2.micro" || data.aws_db_instance.database.db_instance_class == "db.t2.large" || data.aws_db_instance.database.db_instance_class == "db.t2.small" || data.aws_db_instance.database.db_instance_class == "db.t2.medium" ? "1" : "0"}"
}
