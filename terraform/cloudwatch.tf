resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = "${var.app_prefix}-dashboard"

  dashboard_body = jsonencode({
    "widgets" : [
      {
        "height" : 6,
        "width" : 7,
        "y" : 0,
        "x" : 0,
        "type" : "metric",
        "properties" : {
          "legend" : {
            "position" : "bottom"
          },
          "liveData" : false,
          "metrics" : [
            [{ "expression" : "mm1m0 * 100 / mm0m0", "id" : "expr1m0", "label" : "projeto-devops", "stat" : "Average" }],
            ["ECS/ContainerInsights", "CpuReserved", "ClusterName", "projeto-devops", { "id" : "mm0m0", "stat" : "Sum", "visible" : false }],
            [".", "CpuUtilized", ".", ".", { "id" : "mm1m0", "stat" : "Sum", "visible" : false }]
          ],
          "period" : 60,
          "region" : "us-east-1",
          "timezone" : "Local",
          "title" : "CPU utilization",
          "yAxis" : {
            "left" : {
              "label" : "Percent",
              "min" : 0,
              "showUnits" : false
            }
          }
        }
      },
      {
        "height" : 6,
        "width" : 8,
        "y" : 0,
        "x" : 7,
        "type" : "metric",
        "properties" : {
          "legend" : {
            "position" : "bottom"
          },
          "liveData" : false,
          "metrics" : [
            [{ "expression" : "mm1m0 * 100 / mm0m0", "id" : "expr1m0", "label" : "projeto-devops", "stat" : "Average" }],
            ["ECS/ContainerInsights", "MemoryReserved", "ClusterName", "projeto-devops", { "id" : "mm0m0", "stat" : "Sum", "visible" : false }],
            [".", "MemoryUtilized", ".", ".", { "id" : "mm1m0", "stat" : "Sum", "visible" : false }]
          ],
          "period" : 60,
          "region" : "us-east-1",
          "timezone" : "Local",
          "title" : "Memory utilization",
          "yAxis" : {
            "left" : {
              "label" : "Percent",
              "min" : 0,
              "showUnits" : false
            }
          }
        }
      },
      {
        "height" : 6,
        "width" : 9,
        "y" : 0,
        "x" : 15,
        "type" : "metric",
        "properties" : {
          "legend" : {
            "position" : "bottom"
          },
          "liveData" : false,
          "metrics" : [
            [{ "expression" : "mm0m0 + mm1m0", "id" : "expr1m0", "label" : "projeto-devops", "stat" : "Average" }],
            ["ECS/ContainerInsights", "NetworkRxBytes", "ClusterName", "projeto-devops", { "id" : "mm0m0", "stat" : "Average", "visible" : false }],
            [".", "NetworkTxBytes", ".", ".", { "id" : "mm1m0", "stat" : "Average", "visible" : false }]
          ],
          "period" : 60,
          "region" : "us-east-1",
          "timezone" : "Local",
          "title" : "Network",
          "yAxis" : {
            "left" : {
              "label" : "Bytes/Second",
              "showUnits" : false
            }
          }
        }
      },
      {
        "height" : 6,
        "width" : 6,
        "y" : 6,
        "x" : 0,
        "type" : "metric",
        "properties" : {
          "legend" : {
            "position" : "bottom"
          },
          "liveData" : false,
          "metrics" : [
            [{ "expression" : "mm1m0 * 100 / mm0m0", "id" : "expr1m0", "label" : "projeto-devops", "stat" : "Average" }],
            ["ECS/ContainerInsights", "EphemeralStorageReserved", "ClusterName", "projeto-devops", { "id" : "mm0m0", "stat" : "Sum", "visible" : false }],
            [".", "EphemeralStorageUtilized", ".", ".", { "id" : "mm1m0", "stat" : "Sum", "visible" : false }]
          ],
          "period" : 60,
          "region" : "us-east-1",
          "timezone" : "Local",
          "title" : "Ephemeral Storage Utilization",
          "yAxis" : {
            "left" : {
              "label" : "Percent",
              "min" : 0,
              "showUnits" : false
            }
          }
        }
      },
      {
        "height" : 6,
        "width" : 6,
        "y" : 6,
        "x" : 6,
        "type" : "metric",
        "properties" : {
          "legend" : {
            "position" : "bottom"
          },
          "liveData" : false,
          "metrics" : [
            ["ECS/ContainerInsights", "ContainerInstanceCount", "ClusterName", "projeto-devops", { "stat" : "Average" }]
          ],
          "period" : 60,
          "region" : "us-east-1",
          "timezone" : "Local",
          "title" : "Container Instance Count"
        }
      },
      {
        "height" : 6,
        "width" : 6,
        "y" : 6,
        "x" : 12,
        "type" : "metric",
        "properties" : {
          "legend" : {
            "position" : "bottom"
          },
          "liveData" : false,
          "metrics" : [
            ["ECS/ContainerInsights", "TaskCount", "ClusterName", "projeto-devops", { "stat" : "Average" }]
          ],
          "period" : 60,
          "region" : "us-east-1",
          "timezone" : "Local",
          "title" : "Task Count"
        }
      },
      {
        "height" : 6,
        "width" : 6,
        "y" : 6,
        "x" : 18,
        "type" : "metric",
        "properties" : {
          "legend" : {
            "position" : "bottom"
          },
          "liveData" : false,
          "metrics" : [
            ["ECS/ContainerInsights", "ServiceCount", "ClusterName", "projeto-devops", { "stat" : "Average" }]
          ],
          "period" : 60,
          "region" : "us-east-1",
          "timezone" : "Local",
          "title" : "Service Count"
        }
      }
    ]
  })
}
