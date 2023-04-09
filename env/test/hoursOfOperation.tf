resource "aws_connect_hours_of_operation" "always_open_hours" {
  instance_id = var.instanceId
  name        = "Always Open"
  description = "Always open"
  time_zone   = "US/Central"

  config {
    day = "MONDAY"

    start_time {
      hours   = 0
      minutes = 0
    }

    end_time {
      hours   = 0
      minutes = 0
    }
  }

  config {
    day = "TUESDAY"

    start_time {
      hours   = 0
      minutes = 0
    }

    end_time {
      hours   = 0
      minutes = 0
    }
  }

  config {
    day = "WEDNESDAY"

    start_time {
      hours   = 0
      minutes = 0
    }

    end_time {
      hours   = 0
      minutes = 0
    }
  }

  config {
    day = "THURSDAY"

    start_time {
      hours   = 0
      minutes = 0
    }

    end_time {
      hours   = 0
      minutes = 0
    }
  }

  config {
    day = "FRIDAY"

    start_time {
      hours   = 0
      minutes = 0
    }

    end_time {
      hours   = 0
      minutes = 0
    }
  }

  config {
    day = "SATURDAY"

    start_time {
      hours   = 0
      minutes = 0
    }

    end_time {
      hours   = 0
      minutes = 0
    }
  }

  config {
    day = "SUNDAY"

    start_time {
      hours   = 0
      minutes = 0
    }

    end_time {
      hours   = 0
      minutes = 0
    }
  }

  tags = {
    "Name" = "Always Open"
  }
}