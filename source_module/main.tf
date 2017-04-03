resource "aws_cloudwatch_metric_alarm" "alarm_rds_CPU" {
  alarm_name = "${var.name}_alarm_rds_CPU"
  comparison_operator = "${var.comparison_operator}"
  evaluation_periods = "${var.evaluation_periods}"
  metric_name = "CPUUtilization"
  namespace = "${var.namespace}"
  period = "${var.period}"
  statistic = "${var.statistic}"
  threshold = "80.0"
  unit = "Percent"
  alarm_description = ""
  alarm_actions = ["arn:aws:sns:us-east-1:615329498766:ct-users-anu"]
  dimensions {
      DBInstanceIdentifier = "${var.name}"
  }
}

resource "aws_cloudwatch_metric_alarm" "alarm_rds_StorageSpace" {
  alarm_name = "${var.name}_alarm_rds_StorageSpace"
  comparison_operator = "${var.comparison_operator}"
  evaluation_periods = "${var.evaluation_periods}"
  metric_name = "FreeStorageSpace"
  namespace = "${var.namespace}"
  period = "${var.period}"
  statistic = "${var.statistic}"
  threshold = "10000000000.0"
  alarm_description = ""
  alarm_actions = ["arn:aws:sns:us-east-1:615329498766:ct-users-anu"]
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
  threshold = "5000000.0"
  alarm_description = ""
  alarm_actions = ["arn:aws:sns:us-east-1:615329498766:ct-users-anu"]
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
  threshold = "1600.0"
  alarm_description = ""
  alarm_actions = ["arn:aws:sns:us-east-1:615329498766:ct-users-anu"]
  dimensions {
      DBInstanceIdentifier = "${var.name}"
  }
}

resource "aws_cloudwatch_metric_alarm" "alarm_rds_ReadThrottleEvents" {
  alarm_name = "${var.name}_alarm_rds_ReadThrottleEvents"
  comparison_operator = "${var.comparison_operator}"
  evaluation_periods = "${var.evaluation_periods}"
  metric_name = "ReadThrottleEvents"
  namespace = "${var.namespace}"
  period = "60"
  statistic = "${var.statistic}"
  threshold = "20.0"
  alarm_description = ""
  alarm_actions = ["arn:aws:sns:us-east-1:615329498766:ct-users-anu"]
  dimensions {
      DBInstanceIdentifier = "${var.name}"
  }
}

resource "aws_cloudwatch_metric_alarm" "alarm_rds_WriteThrottleEvents" {
  alarm_name = "${var.name}_alarm_rds_WriteThrottleEvents"
  comparison_operator = "${var.comparison_operator}"
  evaluation_periods = "${var.evaluation_periods}"
  metric_name = "WriteThrottleEvents"
  namespace = "${var.namespace}"
  period = "60"
  statistic = "${var.statistic}"
  threshold = "20.0"
  alarm_description = ""
  alarm_actions = ["arn:aws:sns:us-east-1:615329498766:ct-users-anu"]
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
  threshold = "800.0"
  alarm_description = ""
  alarm_actions = ["arn:aws:sns:us-east-1:615329498766:ct-users-anu"]
  dimensions {
      DBInstanceIdentifier = "${var.name}"
  }
}

resource "aws_cloudwatch_metric_alarm" "alarm_rds_ReadIOPS" {
  alarm_name = "${var.name}_alarm_rds_ReadIOPS"
  comparison_operator = "${var.comparison_operator}"
  evaluation_periods = "${var.evaluation_periods}"
  metric_name = "ReadIOPS"
  namespace = "${var.namespace}"
  period = "${var.period}"
  statistic = "${var.statistic}"
  threshold = "200.0"
  alarm_description = ""
  alarm_actions = ["arn:aws:sns:us-east-1:615329498766:ct-users-anu"]
  dimensions {
      DBInstanceIdentifier = "${var.name}"
  }
}
