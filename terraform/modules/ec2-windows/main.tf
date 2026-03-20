resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  iam_instance_profile   = var.instance_profile_name

  associate_public_ip_address = true

  user_data = <<-EOF
              <powershell>
              New-Item -ItemType Directory -Path "C:\\Temp" -Force | Out-Null
              $msiPath = "C:\\Temp\\AWSCLIV2.msi"
              Invoke-WebRequest -Uri "https://awscli.amazonaws.com/AWSCLIV2.msi" -OutFile $msiPath
              Start-Process msiexec.exe -ArgumentList "/i $msiPath /qn" -Wait
              aws --version | Out-File -FilePath "C:\\Temp\\aws-cli-version.txt"
              </powershell>
              EOF

  root_block_device {
    volume_size = 50
    volume_type = "gp3"
    encrypted   = true
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-windows"
  }
}
