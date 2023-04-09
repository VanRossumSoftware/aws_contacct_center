resource "aws_connect_queue" "default_queue" {
  instance_id           = var.instanceId
  name                  = "default_queue"
  description           = "Default Queue"
  hours_of_operation_id = aws_connect_hours_of_operation.always_open_hours.hours_of_operation_id

  tags = {
    "Name" = "Default Queue"
  }
}