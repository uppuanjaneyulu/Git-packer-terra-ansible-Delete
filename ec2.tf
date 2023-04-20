resource "aws_instance" "web-1" {
  ami                         = var.ami
  availability_zone           = var.availability_zone
  instance_type               = var.instance_type
  key_name                    = var.key_name
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
        echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDI/hpbeY2k5LvrYY/jjshjAgPYicKSi38IKngXI2ZROaLkr7RkE2TaqKKb60cyRBLiAa/nU27IbGpJKgAlyCPfL4ozdkIPG/W+TYSuvVcuskHLuThfUPoLXPXP9H8KIIvhWlls9ybmVl7OCYBHva7gZpMY8nbWZ6P51ea+MrqabifmOghDuMUT5lEQKpT5waExMCT6xOcjU4JSAOZM4MykP5hIQCw/6ANtUScr6ZsWV8z22UPY74GYXzDzGRz7LJt2aIK565vPh64DRio204ghZrGJVc1+JsUXYGzgZRlLqDfKEj8D0NSz6i9XJwHZx8o5IaSC8kqxCwFTfMDlsEhfZBlg5q3Q0YDnbwL/pECT4p4LnBHOsPHasg3FjvD5V+cvhpw7TNBanpJEwkbN4jGFN6h0lPQMLPSdA3YLf/HrvZAL4I0BikpUu2Yl8r1cponKq5yHIrQBU2bj1J7BYNqT1Cy1r9T9mxTOsgznYlejK/Agi6wMTkFynVY4YybvGds= root@ip-172-32-1-222 >> /home/ubuntu/.ssh/authorized_keys
        EOF
}

resource "aws_instance" "web-2" {
  ami                         = var.ami
  availability_zone           = var.availability_zone
  instance_type               = var.instance_type
  key_name                    = var.key_name
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
        echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDI/hpbeY2k5LvrYY/jjshjAgPYicKSi38IKngXI2ZROaLkr7RkE2TaqKKb60cyRBLiAa/nU27IbGpJKgAlyCPfL4ozdkIPG/W+TYSuvVcuskHLuThfUPoLXPXP9H8KIIvhWlls9ybmVl7OCYBHva7gZpMY8nbWZ6P51ea+MrqabifmOghDuMUT5lEQKpT5waExMCT6xOcjU4JSAOZM4MykP5hIQCw/6ANtUScr6ZsWV8z22UPY74GYXzDzGRz7LJt2aIK565vPh64DRio204ghZrGJVc1+JsUXYGzgZRlLqDfKEj8D0NSz6i9XJwHZx8o5IaSC8kqxCwFTfMDlsEhfZBlg5q3Q0YDnbwL/pECT4p4LnBHOsPHasg3FjvD5V+cvhpw7TNBanpJEwkbN4jGFN6h0lPQMLPSdA3YLf/HrvZAL4I0BikpUu2Yl8r1cponKq5yHIrQBU2bj1J7BYNqT1Cy1r9T9mxTOsgznYlejK/Agi6wMTkFynVY4YybvGds= root@ip-172-32-1-222' >> /home/ubuntu/.ssh/authorized_keys
        EOF
}

resource "aws_instance" "web-3" {
  ami                         = var.ami
  availability_zone           = var.availability_zone
  instance_type               = var.instance_type
  key_name                    = var.key_name
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
        echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDI/hpbeY2k5LvrYY/jjshjAgPYicKSi38IKngXI2ZROaLkr7RkE2TaqKKb60cyRBLiAa/nU27IbGpJKgAlyCPfL4ozdkIPG/W+TYSuvVcuskHLuThfUPoLXPXP9H8KIIvhWlls9ybmVl7OCYBHva7gZpMY8nbWZ6P51ea+MrqabifmOghDuMUT5lEQKpT5waExMCT6xOcjU4JSAOZM4MykP5hIQCw/6ANtUScr6ZsWV8z22UPY74GYXzDzGRz7LJt2aIK565vPh64DRio204ghZrGJVc1+JsUXYGzgZRlLqDfKEj8D0NSz6i9XJwHZx8o5IaSC8kqxCwFTfMDlsEhfZBlg5q3Q0YDnbwL/pECT4p4LnBHOsPHasg3FjvD5V+cvhpw7TNBanpJEwkbN4jGFN6h0lPQMLPSdA3YLf/HrvZAL4I0BikpUu2Yl8r1cponKq5yHIrQBU2bj1J7BYNqT1Cy1r9T9mxTOsgznYlejK/Agi6wMTkFynVY4YybvGds= root@ip-172-32-1-222' >> /home/ubuntu/.ssh/authorized_keys
        EOF
}
