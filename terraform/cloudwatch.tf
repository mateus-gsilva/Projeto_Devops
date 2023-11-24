resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = "projeto-devops-dashboard"

  dashboard_body = jsonencode({
    "widgets": [
        {
            "height": 6,
            "width": 7,
            "y": 0,
            "x": 0,
            "type": "metric",
            "properties": {
                "legend": {
                    "position": "bottom"
                },
                "liveData": false,
                "metrics": [
                    [ { "expression": "mm1m0 * 100 / mm0m0", "id": "expr1m0", "label": "projeto-devops", "stat": "Average" } ],
                    [ "ECS/ContainerInsights", "CpuReserved", "ClusterName", "projeto-devops", { "id": "mm0m0", "stat": "Sum", "visible": false } ],
                    [ ".", "CpuUtilized", ".", ".", { "id": "mm1m0", "stat": "Sum", "visible": false } ]
                ],
                "period": 60,
                "region": "us-east-1",
                "timezone": "Local",
                "title": "CPU utilization",
                "yAxis": {
                    "left": {
                        "label": "Percent",
                        "min": 0,
                        "showUnits": false
                    }
                }
            }
        },
        {
            "height": 6,
            "width": 7,
            "y": 0,
            "x": 7,
            "type": "metric",
            "properties": {
                "legend": {
                    "position": "bottom"
                },
                "liveData": false,
                "metrics": [
                    [ { "expression": "mm1m0 * 100 / mm0m0", "id": "expr1m0", "label": "projeto-devops", "stat": "Average" } ],
                    [ "ECS/ContainerInsights", "MemoryReserved", "ClusterName", "projeto-devops", { "id": "mm0m0", "stat": "Sum", "visible": false } ],
                    [ ".", "MemoryUtilized", ".", ".", { "id": "mm1m0", "stat": "Sum", "visible": false } ]
                ],
                "period": 60,
                "region": "us-east-1",
                "timezone": "Local",
                "title": "Memory utilization",
                "yAxis": {
                    "left": {
                        "label": "Percent",
                        "min": 0,
                        "showUnits": false
                    }
                }
            }
        },
        {
            "height": 6,
            "width": 10,
            "y": 0,
            "x": 14,
            "type": "metric",
            "properties": {
                "legend": {
                    "position": "bottom"
                },
                "liveData": false,
                "metrics": [
                    [ { "expression": "mm0m0 + mm1m0", "id": "expr1m0", "label": "projeto-devops", "stat": "Average" } ],
                    [ "ECS/ContainerInsights", "NetworkRxBytes", "ClusterName", "projeto-devops", { "id": "mm0m0", "stat": "Average", "visible": false } ],
                    [ ".", "NetworkTxBytes", ".", ".", { "id": "mm1m0", "stat": "Average", "visible": false } ]
                ],
                "period": 60,
                "region": "us-east-1",
                "timezone": "Local",
                "title": "Network",
                "yAxis": {
                    "left": {
                        "label": "Bytes/Second",
                        "showUnits": false
                    }
                }
            }
        },
        {
            "height": 6,
            "width": 7,
            "y": 6,
            "x": 0,
            "type": "metric",
            "properties": {
                "legend": {
                    "position": "bottom"
                },
                "liveData": false,
                "metrics": [
                    [ { "expression": "mm1m0 * 100 / mm0m0", "id": "expr1m0", "label": "projeto-devops", "stat": "Average", "region": "us-east-1" } ],
                    [ "ECS/ContainerInsights", "EphemeralStorageReserved", "ClusterName", "projeto-devops", { "id": "mm0m0", "stat": "Sum", "visible": false, "region": "us-east-1" } ],
                    [ "ECS/ContainerInsights", "EphemeralStorageUtilized", "ClusterName", "projeto-devops", { "id": "mm1m0", "stat": "Sum", "visible": false, "region": "us-east-1" } ]
                ],
                "period": 60,
                "region": "us-east-1",
                "timezone": "Local",
                "title": "Ephemeral Storage Utilization",
                "yAxis": {
                    "left": {
                        "label": "Percent",
                        "min": 0,
                        "showUnits": false
                    }
                }
            }
        },
        {
            "height": 6,
            "width": 10,
            "y": 6,
            "x": 14,
            "type": "metric",
            "properties": {
                "legend": {
                    "position": "bottom"
                },
                "liveData": false,
                "metrics": [
                    [ "ECS/ContainerInsights", "TaskCount", "ClusterName", "projeto-devops", { "stat": "Average" } ]
                ],
                "period": 60,
                "region": "us-east-1",
                "timezone": "Local",
                "title": "Task Count"
            }
        },
        {
            "height": 6,
            "width": 7,
            "y": 6,
            "x": 7,
            "type": "metric",
            "properties": {
                "legend": {
                    "position": "bottom"
                },
                "liveData": false,
                "metrics": [
                    [ "ECS/ContainerInsights", "ServiceCount", "ClusterName", "projeto-devops", { "stat": "Average" } ]
                ],
                "period": 60,
                "region": "us-east-1",
                "timezone": "Local",
                "title": "Service Count"
            }
        }
    ]
})
}
