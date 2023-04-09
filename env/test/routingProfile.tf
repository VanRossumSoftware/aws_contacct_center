resource "aws_connect_routing_profile" "example" {
  instance_id               = var.instanceId
  name                      = "default_routing_profile"
  default_outbound_queue_id = aws_connect_queue.default_queue.queue_id
  description               = "Default Routing Profile"

  media_concurrencies {
    channel     = "VOICE"
    concurrency = 1
  }

  queue_configs {
    channel  = "VOICE"
    delay    = 2
    priority = 1
    queue_id = aws_connect_queue.default_queue.queue_id
  }

  tags = {
    "Name" = "Default Routing Profile"
  }
}