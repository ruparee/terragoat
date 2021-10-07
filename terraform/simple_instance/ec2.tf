provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "ssh_traffic" {
  name        = "ssh_traffic"
  description = "Allow SSH inbound traffic"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    git_commit           = "5a41d2c0394c51d156e756cca9eaff8bdb2fdd9a"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-10-07 18:48:57"
    git_last_modified_by = "ruparee@users.noreply.github.com"
    git_modifiers        = "ruparee"
    git_org              = "ruparee"
    git_repo             = "terragoat"
    yor_trace            = "55ae18b0-d0f5-498c-a28f-070105561230"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "5a41d2c0394c51d156e756cca9eaff8bdb2fdd9a"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-10-07 18:48:57"
    git_last_modified_by = "ruparee@users.noreply.github.com"
    git_modifiers        = "ruparee"
    git_org              = "ruparee"
    git_repo             = "terragoat"
    yor_trace            = "87d4d782-93ca-433f-a586-899887996abe"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
