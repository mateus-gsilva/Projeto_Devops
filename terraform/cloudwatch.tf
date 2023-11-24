resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = "${var.app_prefix}-dashboard"

  dashboard_body = jsonencode({
    "widgets": [
        {
            "type": "metric",
            "x": 0,
            "y": 0,
            "width": 4,
            "height": 6,
            "properties": {
                "region": "${var.aws_region}",
                "title": "CPU utilization",
                "legend": {"position": "bottom"},
                "timezone": "Local",
                "metrics": [
                    [{"id": "expr1m0", "label": "${var.app_prefix}", "expression": "mm1m0 * 100 / mm0m0", "stat": "Average"}],
                    ["ECS/ContainerInsights", "CpuReserved", "ClusterName", "${var.app_prefix}", {"id": "mm0m0", "visible": false, "stat": "Sum"}],
                    [".", "CpuUtilized", ".", ".", {"id": "mm1m0", "visible": false, "stat": "Sum"}]
                ],
                "liveData": false,
                "period": 60,
                "yAxis": {"left": {"min": 0, "showUnits": false, "label": "Percent"}}
            }
        },
        {
            "type": "metric",
            "x": 4,
            "y": 0,
            "width": 4,
            "height": 6,
            "properties": {
                "region": "${var.aws_region}",
                "title": "Memory utilization",
                "legend": {"position": "bottom"},
                "timezone": "Local",
                "metrics": [
                    [{"id": "expr1m0", "label": "${var.app_prefix}", "expression": "mm1m0 * 100 / mm0m0", "stat": "Average"}],
                    ["ECS/ContainerInsights", "MemoryReserved", "ClusterName", "${var.app_prefix}", {"id": "mm0m0", "visible": false, "stat": "Sum"}],
                    [".", "MemoryUtilized", ".", ".", {"id": "mm1m0", "visible": false, "stat": "Sum"}]
                ],
                "liveData": false,
                "period": 60,
                "yAxis": {"left": {"min": 0, "showUnits": false, "label": "Percent"}}
            }
        },
        {
            "type": "metric",
            "x": 8,
            "y": 0,
            "width": 4,
            "height": 6,
            "properties": {
                "region": "${var.aws_region}",
                "title": "Network",
                "legend": {"position": "bottom"},
                "timezone": "Local",
                "metrics": [
                    [{"id": "expr1m0", "label": "${var.app_prefix}", "expression": "mm0m0 + mm1m0", "stat": "Average"}],
                    ["ECS/ContainerInsights", "NetworkRxBytes", "ClusterName", "${var.app_prefix}", {"id": "mm0m0", "visible": false, "stat": "Average"}],
                    [".", "NetworkTxBytes", ".", ".", {"id": "mm1m0", "visible": false, "stat": "Average"}]
                ],
                "liveData": false,
                "period": 60,
                "yAxis": {"left": {"showUnits": false, "label": "Bytes/Second"}}
            }
        },
        {
            "type": "metric",
            "x": 12,
            "y": 0,
            "width": 3,
            "height": 6,
            "properties": {
                "region": "${var.aws_region}",
                "title": "Ephemeral Storage Utilization",
                "legend": {"position": "bottom"},
                "timezone": "Local",
                "metrics": [
                    [{"id": "expr1m0", "label": "${var.app_prefix}", "expression": "mm1m0 * 100 / mm0m0", "stat": "Average"}],
                    ["ECS/ContainerInsights", "EphemeralStorageReserved", "ClusterName", "${var.app_prefix}", {"id": "mm0m0", "visible": false, "stat": "Sum"}],
                    [".", "EphemeralStorageUtilized", ".", ".", {"id": "mm1m0", "visible": false, "stat": "Sum"}]
                ],
                "liveData": false,
                "period": 60,
                "yAxis": {"left": {"min": 0, "showUnits": false, "label": "Percent"}}
            }
        },
        {
            "type": "metric",
            "x": 15,
            "y": 0,
            "width": 3,
            "height": 6,
            "properties": {
                "region": "${var.aws_region}",
                "title": "Container Instance Count",
                "legend": {"position": "bottom"},
                "timezone": "Local",
                "metrics": [["ECS/ContainerInsights", "ContainerInstanceCount", "ClusterName", "${var.app_prefix}", {"stat": "Average"}]],
                "liveData": false,
                "period": 60
            }
        },
        {
            "type": "metric",
            "x": 18,
            "y": 0,
            "width": 3,
            "height": 6,
            "properties": {
                "region": "${var.aws_region}",
                "title": "Task Count",
                "legend": {"position": "bottom"},
                "timezone": "Local",
                "metrics": [["ECS/ContainerInsights", "TaskCount", "ClusterName", "${var.app_prefix}", {"stat": "Average"}]],
                "liveData": false,
                "period": 60
            }
        },
        {
            "type": "metric",
            "x": 21,
            "y": 0,
            "width": 3,
            "height": 6,
            "properties": {
                "region": "${var.aws_region}",
                "title": "Service Count",
                "legend": {"position": "bottom"},
                "timezone": "Local",
                "metrics": [["ECS/ContainerInsights", "ServiceCount", "ClusterName", "${var.app_prefix}", {"stat": "Average"}]],
                "liveData": false,
                "period": 60
            }
        }
    ]
})
}
