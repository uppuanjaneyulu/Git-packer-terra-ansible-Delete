resource "aws_instance" "web-1" {
  ami                         = var.ami
  availability_zone           = var.availability_zone
  instance_type               = var.instance_type
  key_name                    = var.key_name
  iam_instance_profile        = aws_iam_instance_profile.instance_profile.name
  subnet_id                   = aws_subnet.public-subnet.id
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name       = "Server-1"
    Env        = "Prod"
    Owner      = "Anji"
    CostCenter = "ABCD"
  }
  user_data = <<-EOF
        #!/bin/bash
        echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDBLEqIYkKLu21WMIjXPXhkmhybnhKhbt/qF4RCPwoyq6knPQkxcBdhr4x2fE2ANUlQNy7cbiF4bqnpUAtyqNqEsqvFVQA495k/WIBpwTvJFhPAfMXxV/H9unQRj5jqhZW5xF3ia3Hkw1Ue9vm9Br+3NDPVW98zH8FPkNL3XolBSS7RS/9pT6Hp828jCMWcALAyQdaw0ew0T24yezK0WGrMreK6KoyF4x0vV9BUFUlTup3Q79xZpOZ09iPmdGMJCrlZk7uU9/eilYWR7gP5NsnJu03+j17VzskkAbWgezpYZH+KeMzf85/NY0dN31pjvw/Kx7dC0M2XruLp3eaTPlcNAwxv9TfA2rtCg8WvBKsYb4QkbcRvC7ZdQDQziqujsB90l/9d15fQMpk3XyU1w5eRH9yMH0tVH4Kwt7mAaVKmWhG9EXsRPsTEtfPsLm9b8MfN1bgG3aROUeLj7zREhBn4CXSxyoNZGUvW5oT+0WZOOVGlpOAkanBAFqHcykC2wMM= root@ip-10-1-1-117 >> /home/ubuntu/.ssh/authorized_keys
        EOF
}

resource "aws_instance" "web-2" {
  ami                         = var.ami
  availability_zone           = var.availability_zone
  instance_type               = var.instance_type
  key_name                    = var.key_name
  iam_instance_profile        = aws_iam_instance_profile.instance_profile.name
  subnet_id                   = aws_subnet.public-subnet.id
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name       = "Server-2"
    Env        = "Prod"
    Owner      = "Anji"
    CostCenter = "ABCD"
  }
  user_data = <<-EOF
        #!/bin/bash
        echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDBLEqIYkKLu21WMIjXPXhkmhybnhKhbt/qF4RCPwoyq6knPQkxcBdhr4x2fE2ANUlQNy7cbiF4bqnpUAtyqNqEsqvFVQA495k/WIBpwTvJFhPAfMXxV/H9unQRj5jqhZW5xF3ia3Hkw1Ue9vm9Br+3NDPVW98zH8FPkNL3XolBSS7RS/9pT6Hp828jCMWcALAyQdaw0ew0T24yezK0WGrMreK6KoyF4x0vV9BUFUlTup3Q79xZpOZ09iPmdGMJCrlZk7uU9/eilYWR7gP5NsnJu03+j17VzskkAbWgezpYZH+KeMzf85/NY0dN31pjvw/Kx7dC0M2XruLp3eaTPlcNAwxv9TfA2rtCg8WvBKsYb4QkbcRvC7ZdQDQziqujsB90l/9d15fQMpk3XyU1w5eRH9yMH0tVH4Kwt7mAaVKmWhG9EXsRPsTEtfPsLm9b8MfN1bgG3aROUeLj7zREhBn4CXSxyoNZGUvW5oT+0WZOOVGlpOAkanBAFqHcykC2wMM= root@ip-10-1-1-117' >> /home/ubuntu/.ssh/authorized_keys
        EOF
}

resource "aws_instance" "web-3" {
  ami                         = var.ami
  availability_zone           = var.availability_zone
  instance_type               = var.instance_type
  key_name                    = var.key_name
  iam_instance_profile        = aws_iam_instance_profile.instance_profile.name
  subnet_id                   = aws_subnet.public-subnet.id
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name       = "Server-3"
    Env        = "Prod"
    Owner      = "Anji"
    CostCenter = "ABCD"
  }
  user_data = <<-EOF
        #!/bin/bash
        echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDBLEqIYkKLu21WMIjXPXhkmhybnhKhbt/qF4RCPwoyq6knPQkxcBdhr4x2fE2ANUlQNy7cbiF4bqnpUAtyqNqEsqvFVQA495k/WIBpwTvJFhPAfMXxV/H9unQRj5jqhZW5xF3ia3Hkw1Ue9vm9Br+3NDPVW98zH8FPkNL3XolBSS7RS/9pT6Hp828jCMWcALAyQdaw0ew0T24yezK0WGrMreK6KoyF4x0vV9BUFUlTup3Q79xZpOZ09iPmdGMJCrlZk7uU9/eilYWR7gP5NsnJu03+j17VzskkAbWgezpYZH+KeMzf85/NY0dN31pjvw/Kx7dC0M2XruLp3eaTPlcNAwxv9TfA2rtCg8WvBKsYb4QkbcRvC7ZdQDQziqujsB90l/9d15fQMpk3XyU1w5eRH9yMH0tVH4Kwt7mAaVKmWhG9EXsRPsTEtfPsLm9b8MfN1bgG3aROUeLj7zREhBn4CXSxyoNZGUvW5oT+0WZOOVGlpOAkanBAFqHcykC2wMM= root@ip-10-1-1-117' >> /home/ubuntu/.ssh/authorized_keys
        EOF
}
